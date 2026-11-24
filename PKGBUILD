# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=3.2
pkgrel=1
pkgdesc='Deploy Haskell software for installation'
arch=('x86_64')
url="https://codeberg.org/dinofp/${pkgname}"
license=('ISC')
depends=(fuse2)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)

_appimageFile="${pkgname}-${pkgver}-${arch}.AppImage"
source=("${url}/releases/download/${pkgver}/${_appimageFile}")

sha256sums=('042598f2c65af26bcdb1686ebffbedaa8919a7535699dba23b9ba8601231e45b')


# PKGBUILD functions

package() {
  _licenseSrcPath="usr/share/${pkgname}/doc/LICENSE"

  chmod +x "${_appimageFile}"
  ./${_appimageFile} --appimage-extract "${_licenseSrcPath}"

  install -m 755 -D "${_appimageFile}" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "squashfs-root/${_licenseSrcPath}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
