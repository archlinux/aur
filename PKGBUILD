# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=raw2ometiff
pkgver=0.5.0
pkgrel=1
pkgdesc='Raw format to OME-TIFF converter'
arch=('any')
url='https://github.com/glencoesoftware/raw2ometiff'
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/glencoesoftware/raw2ometiff/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9fdabb2c79b6c9dfc65765aebdc9646b2b0609218d7d388a342ba07bbf1c0f865299551c605d4341776ab27a1ee3b190c61b48fbbf2ab9583679288159d3a2e5')

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
