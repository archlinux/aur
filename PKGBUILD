# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname='mpv-discordrpc'
pkgver=1.4.1
pkgrel=1
pkgdesc='Discord Rich Presence integration for mpv Media Player'
url='https://github.com/cniw/mpv-discordRPC'
arch=('any')
license=('MIT')
makedepends=('sed')
depends=('discord-rpc-api' 'python-pypresence')
source=("https://github.com/cniw/mpv-discordRPC/releases/download/v1.4.1/mpv-discordRPC-${pkgver}-linux.zip")
md5sums=('4c2a749fb3e7f9b627448737851e742a')

package() {

  # arch mpv from 'community' not linked against luajit so using the lua backed isn't very sensible
  sed '1 s/lua-discordRPC/pypresence/' -i "${srcdir}/mpv_discordRPC.conf" # use pypresence backend
  sed '11 s/lua-discordRPC/pypresence/' -i "${srcdir}/mpv-discordRPC.lua" # use pypresence backend
  
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dt "${pkgdir}/etc/mpv/scripts/" -m644 "${srcdir}/mpv-discordRPC_pypresence.py"
  install -Dt "${pkgdir}/etc/mpv/scripts/" -m644 "${srcdir}/status-line.lua"
  install -Dt "${pkgdir}/etc/mpv/scripts/" -m644 "${srcdir}/mpv-discordRPC.lua"
  install -Dt "${pkgdir}/etc/mpv/scripts/" -m644 "${srcdir}/mpv-discordRPC_catalogs.lua"
  install -Dt "${pkgdir}/etc/mpv/script-opts/" -m644 "${srcdir}/mpv_discordRPC.conf"
}

# vim: set ts=2 sw=2 et:
