# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=minlog-git
pkgver=174.2194825
pkgrel=1
pkgdesc="Interactive proof system based on first order natural deduction calculus."
arch=('any')
url="http://www.mathematik.uni-muenchen.de/~logik/minlog/index.php"
license=('GPL')
#you need a scheme, make searches for petite chez scheme, mzscheme or guile,
# in that order. I build with guile, because it is a dep of make and anyone has it
depends=('bash')
makedepends=('texlive-core' 'git')
source=("git+http://www.mathematik.uni-muenchen.de/~minlogit/git/minlog.git")
md5sums=('SKIP')
_gitname="minlog"

pkgver() {
  cd "$srcdir"/"$_gitname"
   printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make DESTDIR=usr
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir/usr"
}
