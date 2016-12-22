# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-thrift_protocol-git
pkgver=r4870.db3a92e
pkgrel=1
pkgdesc="PHP extension for accelerating (de)serialization of thrift's binary format (development version)"
arch=('i686' 'x86_64')
url='http://thrift.apache.org/'
license=('Apache')
depends=('php')
makedepends=('git')
optdepends=('thrift: For compiling Thrift IDL files')
provides=("php-thrift_protocol=${pkgver}")
conflicts=('php-thrift_protocol')
source=("git://git.apache.org/thrift.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/thrift"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/thrift/lib/php/src/ext/thrift_protocol"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/thrift/lib/php/src/ext/thrift_protocol"

  make install INSTALL_ROOT="${pkgdir}"
}
