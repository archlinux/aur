# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=libphonenumber
pkgver=7.2.1
pkgrel=1
pkgdesc='library for parsing, formatting, storing and validating phone numbers by Google'
arch=('i686' 'x86_64')
url='https://github.com/googlei18n/libphonenumber'
license=('custom')
depends=('boost-libs' 'protobuf')
makedepends=('cmake' 'boost' 'gtest')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4d4497b77c6897358a21d2c646e6fe243fefb551d6806ef28683c6845c04cded')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  # I can't get it to build with maven so use the cmake part to build the C library
  # but not the java and javascript parts
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr cpp
  make all
}

check() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D LICENSE "${pkgdir}/usr/share/licenses/libphonenumber/LICENSE"
}
