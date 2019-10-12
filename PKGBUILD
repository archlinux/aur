# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=mathcomp-git
pkgver=20191007
pkgrel=1
pkgdesc="The Mathematical Components Library for the Coq system."
url="https://math-comp.github.io/math-comp/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq>=8.5')
makedepends=('camlp5>=7.02' 'ocaml-findlib')
provides=('mathcomp')
conflicts=('mathcomp')
source=("${pkgname}::git://github.com/math-comp/math-comp.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$srcdir/$pkgname/mathcomp"

  make -j 3
}

package() {
  cd "$srcdir/$pkgname/mathcomp"

  make DSTROOT="$pkgdir" install
}
