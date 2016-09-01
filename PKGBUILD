# Maintainer: Moses Miller <Majora320@gmail.com>
pkgname=jelly-git
pkgver=r223.6de53f3
pkgrel=1
pkgdesc="An esoratic programming language"
arch=('any')
url="https://github.com/DennisMitchell/jelly"
license=('unknown')
depends=('python3' 'python-sympy')
makedepends=('git')
source=("jelly-git::git+http://github.com/DennisMitchell/jelly")
md5sums=('SKIP')

_python3ver="$(python3 --version | sed -E 's/Python ([[:digit:]].[[:digit:]]).[[:digit:]]/\1/')"

package() {
	cd "$pkgname"
	
	install -D -m444 jelly.py dictionary.py "$pkgdir/usr/lib/python$_python3ver/jelly/"	
	install -D -m555 jelly "$pkgdir/usr/lib/python$_python3ver/jelly/"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "../lib/python$_python3ver/jelly/jelly" "$pkgdir/usr/bin/jelly"
	chmod 555 "$pkgdir/usr/bin/jelly"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
