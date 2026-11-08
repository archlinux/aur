# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=tlg-pc-bin
_pkgname="${pkgname%-bin}"
pkgver=2026.10.27.4825a99
_pkgver="${pkgver%.*}-${pkgver##*.}"
pkgrel=1
pkgdesc='Native PC port of The Last Guardian PS4 game'
arch=('x86_64')
url='https://github.com/HayatoG/tlg_pc'
license=('GPL-2.0-or-later')
depends=('ffmpeg' 'fmt' 'libpng' 'sdl3' 'zydis')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/HayatoG/tlg_pc/releases/download/v${_pkgver}/tlg-linux-x86_64.tar.gz"
       "${_pkgname}"
       "${_pkgname}.desktop")
sha256sums=('d25e9b6ecd79d8d052c3bab7a2d6865a0c5b269cfb4fee72d57950b4fc22bcb2'
            '8e1c6a3d3ca7879234388327e24f967d4ea17a0bf3919fefb863b212a0c6df90'
            '9f4e1402dcad367b42d57967686571392ff8d33bb0344d8e1c83f468ddfdf6dd')

package() {
  cd "tlg-linux-x86_64"
  # Install package files
  install -m 755 -d "${pkgdir}/opt"
  cp -dr --no-preserve=ownership "${srcdir}/tlg-linux-x86_64" "${pkgdir}/opt/${pkgname}"
  # Install launchers and desktop file
  install -m 755 -D "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m 755 -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Enable write-access to anyone to the 'out' directory
  chmod -R o+w "${pkgdir}/opt/${pkgname}/out"
}
