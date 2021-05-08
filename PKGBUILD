# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
_libname=jdepend
pkgname=java-${_libname}
pkgver=2.9.1
pkgrel=4
pkgdesc="Java library for generating design quality metrics"
arch=('any')
url="https://github.com/clarkware/jdepend"
license=('BSD')
depends=('java-runtime-headless')
makedepends=('apache-ant')
checkdepends=('apache-ant')
source=($pkgname-$pkgver.tar.gz::https://github.com/clarkware/jdepend/archive/${pkgver}.tar.gz)
sha512sums=('05dd4451c3da38469ef65051862d3299a6beac373605b7a65300e3322d32907702c2925bf7225716e6ce8b56b55c159fd673632f47961b0e2e13a2788b5b2d17')

build() {
  cd ${_libname}-${pkgver}
  ant jar
}

check() {
  cd ${_libname}-${pkgver}
  ant test
}

package() {
  cd ${_libname}-${pkgver}
  install -Dm644 dist/${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${_libname}-${pkgver}.jar
  ln -s ${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${_libname}.jar
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
