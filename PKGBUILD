# Maintainer: Spyros Stathopoulos <foucault.online[at]gmail[dot]com>
# Contributor: Jon Wilson <bugs@pandorica.net>
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-lua-nv
_pkgname=conky
pkgver=1.11.1
pkgrel=1
pkgdesc="An advanced system monitor for X based on torsmo with lua and nvidia enabled"
arch=('i686' 'x86_64')
url="https://github.com/brndnmtthws/conky"
license=('GPL3' 'BSD')
replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky' 'conky-lua')
depends=('alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxinerama'
         'libxft' 'glib2' 'libxdamage' 'imlib2' 'lua51' 'librsvg' 'tolua++'
         'libxnvctrl')
makedepends=('docbook2x' 'perl-xml-libxml' 'docbook-xml'
             'docbook-xsl' 'cmake')
optdepends=('nvidia: for GT4xx and newer GPUs',
  'nvidia-340xx: for G8x, G9x, GT2xx GPUS',
  'nvidia-304xx: for GeForce 6/7 GPUs')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('77284c5276271a51e2de649263b26d2e9eb9db97')
options=('!strip' 'debug')
install='conky-lua-nv.install'

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D MAINTAINER_MODE=ON \
    -D BUILD_CURL=ON \
    -D BUILD_LUA_RSVG=ON \
    -D BUILD_LUA_CAIRO=ON \
    -D BUILD_LUA_IMLIB2=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_RSS=ON \
    -D BUILD_WEATHER_METAR=ON \
    -D BUILD_WEATHER_XOAP=ON \
    -D BUILD_WLAN=ON \
    -D BUILD_NVIDIA=ON \
    -D BUILD_XDBE=ON \
    -D CMAKE_INSTALL_PREFIX=/usr \
    .


  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE.BSD ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD
  install -D -m644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
  install -D -m644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}

# vim:ts=2:et:sw=2
