# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=selene
_pkgname=Selene
pkgver=0.4
pkgrel=2
pkgdesc="Simple C++11 friendly header-only bindings to Lua"
url="https://github.com/jeremyong/Selene"
arch=('any')
license=('zlib')
depends=('lua')
checkdepends=('cmake')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/jeremyong/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('9751849e9c7920222f6cdf8e010378fb2a567ab7498ea5872c199d17966d7062403d04718a99c7847e6af77468f767999c2d6bbdd3f140307397f6ae36ca356f')

check() {
  cd ${_pkgname}-${pkgver}
  mkdir build
  cd build
  cmake ..
  make
  ./test
}

package() {
  cd ${_pkgname}-${pkgver}

  install -d "${pkgdir}/usr/share"
  cp -r include "${pkgdir}/usr/share"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
