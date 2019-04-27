# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=boost-di
_pkgname=di
pkgver=1.1.0
pkgrel=1
pkgdesc="Boost (experimental) c++14 dependency injection library"
arch=('any')
url="https://github.com/boost-experimental/${_pkgname}"
license=('Boost')
makedepends=('cmake')
source=("${pkgname}.tar.gz::https://github.com/boost-experimental/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2bb52ed621c36e4e301ed7fbe4197980e9110bd4afc4208841637ce112c0d443')

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   cmake .
   make
}

check() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   # let user know this test isn't hung, because it will take around a minute even though tons of prior tests were nearly instant
   sleep 3 && echo && echo "*** test.ft_di_errors will take at least a minute ***" &
   ctest
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}/include/boost"
   install -Dm644 di.hpp "${pkgdir}/usr/include/${pkgname}/di.hpp"
   cp -r di "${pkgdir}/usr/include/${pkgname}"
}
