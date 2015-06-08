# Maintainer: beest <gnubeest@gmail.com>
pkgname=autotrash-git
pkgver=r59.1e3c902
pkgrel=2
pkgdesc="Tool to automatically purge old trashed files."
arch=('i686' 'x86_64')
url="http://www.logfish.net/pr/autotrash/"
license=('GPL3')
depends=('python') 
makedepends=('git docbook2x')
conflicts=('autotrash')
source=("$pkgname::git://github.com/bneijt/autotrash.git")
md5sums=('SKIP')
pkgver() {
	        cd "$pkgname"
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
  cd "$srcdir/$pkgname/doc"
  docbook2man --sgml autotrash.sgml
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root=$pkgdir
  install -Dm644 "$srcdir/$pkgname/doc/AUTOTRASH.1" -t "$pkgdir/usr/share/man/man1"
}
