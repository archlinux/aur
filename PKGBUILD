# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=raw2ometiff
pkgver=0.7.0
pkgrel=2
pkgdesc='Raw format to OME-TIFF converter'
arch=('any')
url='https://github.com/glencoesoftware/raw2ometiff'
license=('GPL-2.0-or-later')
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
sha512sums=('797b2049ff266e82a2dea59e2fb8f76639a179851ca86aca811eb696e3a612cf62edda026c591051992f0abf2fafe328bd5b71ac8498777dd1bbbc405173cee4')

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
