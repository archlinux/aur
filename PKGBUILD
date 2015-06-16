# Maintainer: Cravix < dr dot neemous at gmail dot com >
# Contributor: Changaco < changaco at changaco dot net >

pkgname=elemines-git
_pkgname=elemines
pkgver=0.3.196.cadeb02
pkgrel=1
pkgdesc="an EFL minesweeper clone"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
groups=()
depends=('efl' 'elementary' 'etrophy')
makedepends=('git')
options=('!libtool')
source=("git://git.enlightenment.org/games/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  echo $(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install

  # install license files
  install -Dm644 $srcdir/$_pkgname/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/COPYING
}
