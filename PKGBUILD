# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=libphonenumber
pkgver=7.2.5
pkgrel=1
pkgdesc='library for parsing, formatting, storing and validating phone numbers by Google'
arch=('i686' 'x86_64')
url='https://github.com/googlei18n/libphonenumber'
license=('custom')
depends=('boost-libs' 'protobuf')
makedepends=('cmake' 'boost' 'gtest')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2d9d613bfb3611909ec681fd3e328bb0ec5e2fbcf12539599ae67a4446361d3a')

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
