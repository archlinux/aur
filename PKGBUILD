# Maintainer: rudy.matela
#
# based on z3-git
#
# Dependence on 'java-environment-common', 'mono' and 'ocaml' is optional:
# to deactivate, remove --java, --dotnet and --ml from mk_make arguments.
pkgname=z3
pkgver=4.5.0
pkgrel=2
pkgdesc="A high-performance theorem prover"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'python2' 'java-environment-common' 'mono' 'ocaml' 'ocaml-findlib')
optdepends=('python2: bindings for python2')
conflicts=('z3-bin' 'z3-codeplex' 'z3-git')
provides=('z3')
source=("https://github.com/Z3Prover/z3/archive/z3-$pkgver.tar.gz")
md5sums=('f332befa0d66d81818a06279a0973e25')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  python2 scripts/mk_make.py --dotnet --java --ml --python
  cd "build"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver/build"
  make install DESTDIR="$pkgdir"

  cd ".."
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
