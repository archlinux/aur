# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=rdappler
pkgver=1.0
pkgrel=1
pkgdesc='Retrieve RDAP info and check domain registration status'
arch=('x86_64')
url="https://codeberg.org/dinofp/${pkgname}"
license=('ISC')
depends=(fuse2)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)

_appimageFile="${pkgname}-${pkgver}-${arch}.AppImage"
source=("${url}/releases/download/${pkgver}/${_appimageFile}")
# source=("https://codeberg.org/dinofp/${pkgname}/releases/download/${pkgver}/${_appimageFile}")

sha256sums=('d2524cbfe86b5b41aeb41751dbe47b76edf9f16d80c336296dfec64c75715f4e')


# PKGBUILD functions

package() {
  _licenseSrcPath="usr/share/${pkgname}/doc/LICENSE"

  chmod +x "${_appimageFile}"
  ./${_appimageFile} --appimage-extract "${_licenseSrcPath}"

  install -m 755 -D "${_appimageFile}" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "squashfs-root/${_licenseSrcPath}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
