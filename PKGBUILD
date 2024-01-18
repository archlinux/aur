# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=metar-display-bin
_pkgname=metar-display
pkgver=1.0
pkgrel=1
pkgdesc="Retrieve and parse METAR weather for display. Packaged upstream binaries."
arch=('x86_64')
url="https://github.com/dino-/${_pkgname}"
license=('ISC')
provides=(metar-display)
conflicts=(metar-display)
depends=(fuse2 zlib)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
_appimageFile="${_pkgname}-${pkgver}-${arch}.AppImage"
source=("https://github.com/dino-/${_pkgname}/releases/download/${pkgver}/${_appimageFile}")
sha256sums=('3566e9ab0e7f6cb7782f87f6aa6c8179eb0d8dd288d2f317863d5257d375e0d4')
package() {
  chmod +x "${_appimageFile}"
  ./${_appimageFile} --appimage-extract usr/share/${_pkgname}/doc/LICENSE
  install -m 755 -D "${_pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
  install -m 644 -D "squashfs-root/usr/share/${_pkgname}/doc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
