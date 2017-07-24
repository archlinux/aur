# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgbase=pmk-dumper-git
pkgname=('pmk-dumper-git')

pkgver=r5.fb531d0
pkgrel=1
pkgdesc="Dumps premaster keys from programs that use openssl encryption"
arch=('any')
url='https://github.com/greyltc/openssl-pmk-dumper'
makedepends=('git')
license=('custom')
source=("git+git://github.com/greyltc/openssl-pmk-dumper.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/openssl-pmk-dumper"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/openssl-pmk-dumper"
  git submodule update --init --recursive
}


build() {
  cd "${srcdir}/openssl-pmk-dumper/upstream/upstream/src"
  make
}

package() {
 install -m755 -D "${srcdir}/openssl-pmk-dumper/upstream/upstream/src/libsslkeylog.so" -t "${pkgdir}/usr/lib" 
}
