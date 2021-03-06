# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=minlog-git
pkgver=r610.4a9a1e4
pkgrel=2
pkgdesc="Interactive proof system based on first order natural deduction calculus."
arch=('any')
url="http://www.mathematik.uni-muenchen.de/~logik/minlog/index.php"
license=('GPL')
#you need a scheme, make searches for petite chez scheme, mzscheme or guile,
# in that order. I build with guile, because it is a dep of make and anyone has it
depends=('bash')
makedepends=('texlive-core' 'git')
options=('!makeflags')
source=("git+http://www.mathematik.uni-muenchen.de/~minlogit/git/minlog.git" prefer_guile.patch)
md5sums=('SKIP'
         '3066aa2dccf688b26d1c70ae8ebc3a7d')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/prefer_guile.patch
}

build() {
  cd ${pkgname%-git}
  make DESTDIR=usr
}

package() {
  cd ${pkgname%-git}
  make install DESTDIR="$pkgdir/usr"
}
