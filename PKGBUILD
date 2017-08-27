# Maintainer: Moses Miller <Majora320 at gmail dot com>
pkgname=jelly-git
pkgver=r260.8f1a29f
pkgrel=2
pkgdesc="An esoratic programming language"
arch=('any')
url="http://github.com/DennisMitchell/jelly"
license=('MIT')
depends=('python3' 'python-sympy' 'python-numpy')
makedepends=('git' 'python3')
source=("jelly-git::git+http://github.com/DennisMitchell/jelly")
md5sums=('SKIP')

_python3ver="$(python3 --version | sed -E 's/Python ([[:digit:]].[[:digit:]]).[[:digit:]]/\1/')"

package() {
	libdestdir="$pkgdir/usr/lib/python$_python3ver/jelly"
	bindestdir="$pkgdir/usr/bin"
	bindest="$bindestdir/jelly"

	cd "$pkgname"
	
	install -D -m444 dictionary.py "$libdestdir/dictionary.py"
	install -D -m444 jelly.py "$libdestdir/jelly.py"
	install -D -m555 jelly "$libdestdir/jelly"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$bindestdir"
	ln -s "../lib/python$_python3ver/jelly/jelly" "$bindest"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
