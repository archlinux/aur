# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=z3-stable-git
pkgver=4.4.1.g0f93853
pkgrel=1
pkgdesc="Z3 is a high-performance theorem prover being developed at Microsoft Research (built from Github)"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
makedepends=('python' 'git')
conflicts=('z3-bin')

source=("git+https://github.com/Z3Prover/z3")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/z3"
  git describe | awk 'BEGIN { FS = "-"; OFS = "" }; { print $2, ".", $4 }'
}

build() {
  cd "$srcdir/z3"

  Z3_INSTALL_INCLUDE_DIR="include/z3" \
  python scripts/mk_make.py \
    --prefix="$pkgdir/usr" \
    --pypkgdir="$pkgdir/usr/lib/python3.5/site-packages" \
    --python \
    --java \
    --ml

  cd "$srcdir/z3/build"
  make
}

package() {
  cd "$srcdir/z3/build"
  make install
}
