# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=metar-display-bin
_pkgname=metar-display
pkgver=1.2
pkgrel=1
pkgdesc="Retrieve and parse METAR weather for display. Packaged upstream binaries."
arch=('x86_64')
url="https://codeberg.org/dinofp/${_pkgname}"
license=('ISC')
provides=(metar-display)
conflicts=(metar-display)
depends=(fuse2 zlib)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)

_appimageFile="${_pkgname}-${pkgver}-${arch}.AppImage"
source=("${url}/releases/download/${pkgver}/${_appimageFile}")

sha256sums=('a622a9af789ec6e6daa549bedf7ec16b81f1b46353d0ff0b5c82fce51cc778a6')


# PKGBUILD functions

package() {
  _licenseSrcPath="usr/share/${_pkgname}/doc/LICENSE"

  chmod +x "${_appimageFile}"
  ./${_appimageFile} --appimage-extract "${_licenseSrcPath}"

  install -m 755 -D "${_appimageFile}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m 644 -D "squashfs-root/${_licenseSrcPath}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
