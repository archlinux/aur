# Maintainer: rudy.matela
#
# based on z3-git
#
# By default, this package does not install language bindings for Java, C# and
# OCaml.  Just add relevant packages to makedepends then uncomment relevant
# flags to mk_make to activate any of those.
#
# The Python bindings are built for Python 2 by default. To change to Python 3:
#
#   sed s/python''2/python/g -i PKGBUILD

pkgname=z3
pkgver=4.5.0
pkgrel=4
pkgdesc="A high-performance theorem prover"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
depends=('gcc-libs')
makedepends=('python2') # 'java-environment-common' 'mono' 'ocaml' 'ocaml-findlib')
optdepends=(
  'python2: bindings for python2'
  'python2-setuptools: bindings for python2'
)
conflicts=('z3-bin' 'z3-codeplex' 'z3-git')
provides=('z3')
source=("https://github.com/Z3Prover/z3/archive/z3-$pkgver.tar.gz")
md5sums=('f332befa0d66d81818a06279a0973e25')
sha256sum=('aeae1d239c5e06ac183be7dd853775b84698db1265cb2258e5918a28372d4a0c')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  python2 scripts/mk_make.py --python # --dotnet --java --ml
  cd "build"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver/build"
  make install DESTDIR="$pkgdir"

  cd ".."
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
