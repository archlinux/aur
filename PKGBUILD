# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=bioformats2raw
pkgver=0.7.0
pkgrel=1
pkgdesc='Bio-Formats image file format to raw format converter'
arch=('any')
url='https://github.com/glencoesoftware/bioformats2raw'
license=('GPL')
depends=(
  bash
  blosc
  java-runtime
)
makedepends=(
  git
  gradle
  java-environment
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/glencoesoftware/bioformats2raw/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3a0c0e4a085cd7febf4ce8b2c34ef8322369caa7b368b8ef50f744f6e1377cd8aa97e35a8dc9717409c5ea1db1fb5ad5ca2115953891d5599b468162d88cb194')

package() {
  cd "${pkgname}-${pkgver}"
  gradle --gradle-user-home=/tmp clean installDist -Porg.gradle.java.home=/usr/lib/jvm/default
  install -dm755 ${pkgdir}/opt ${pkgdir}/usr/bin
  cp -a "build/install/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
  ln -sf "/opt/${pkgname}/bin/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}/bin/${pkgname}"
  ln -sf "/opt/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  rm -vf "${pkgdir}/opt/${pkgname}/bin/${pkgname}-${pkgver}.bat"
}
# vim:set ts=2 sw=2 et:
