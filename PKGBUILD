# Maintainer: rudy.matela
#
# based on z3-git
pkgname=z3
pkgver=4.5.0
pkgrel=1
pkgdesc="A high-performance theorem prover"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'python2')
optdepends=('python2: bindings for python2')
conflicts=('z3-bin' 'z3-codeplex' 'z3-git')
provides=('z3')
source=("https://github.com/Z3Prover/z3/archive/z3-$pkgver.tar.gz")
md5sums=('f332befa0d66d81818a06279a0973e25')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  python2 scripts/mk_make.py
  cd "build"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  # If we specify --prefix in build(), it tries to create
  # "$pkgdir/usr/lib/python2.7/dist-packages" immediately, which we can't have.
  python2 scripts/mk_make.py --prefix="$pkgdir/usr"

  cd "build"
  make install

  cd ".."
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
