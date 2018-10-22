# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=libsnark-git
_pkgname=libsnark
pkgver=v20140603.r321.g3e92af1
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="libsnark: a C++ library for zkSNARK proofs"
arch=('i686' 'x86_64')
url="https://github.com/scipr-lab/libsnark"
license=('MIT')
depends=('gmp')
makedepends=('cmake')
provides=('libsnark')
source=("git+https://github.com/scipr-lab/libsnark.git")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  git submodule update --init
  cmake .
  make
}

check() {
  cd "$srcdir/$_pkgname"

  make -k check
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
