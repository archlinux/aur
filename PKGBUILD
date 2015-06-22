# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=libphonenumber
pkgver=7.0.6
pkgrel=1
pkgdesc='library for parsing, formatting, storing and validating phone numbers by Google'
arch=('i686' 'x86_64')
url='https://github.com/googlei18n/libphonenumber'
license=('custom')
depends=('boost-libs' 'protobuf')
makedepends=('cmake' 'boost' 'gtest')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3041e538d72c6b2e42e68da69df7ca6f74b84584ce148e0d33c87a1cd62b7cbc')

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
