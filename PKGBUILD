# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=tpm2-pk11-git
pkgver=r55.7aeef80
pkgrel=1
pkgdesc="PKCS#11 Module for TPM 2.0"
arch=('i686' 'x86_64')
url="https://github.com/irtimmer/tpm2-pk11"
license=('LGPL')
depends=('tpm2-abrmd')
makedepends=('git' 'cmake')
source=("git+https://github.com/irtimmer/tpm2-pk11.git")
sha256sums=('SKIP')

pkgver() {
  cd tpm2-pk11
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  cmake ../tpm2-pk11 -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
