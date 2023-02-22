# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='repath'
pkgname="python-${_pkgname}"
pkgver=0.9.0 # From https://pypi.org/project/repath/, although it isn't tagged on github.
pkgrel=1
pkgdesc='Parses express-style paths to PCRE regular expression patterns.'
arch=(any)
url="https://github.com/nickcoutsos/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
sha256sums=('SKIP')
source=("git+${url}.git#commit=a9ab3136bb05abafb44811d60c87f9d1d035197a")

_srcdir="$pkgname"

prepare() {
	cd "$_srcdir"
	python 'setup.py' build
}

package() {
	cd "$_srcdir"
	
	python 'setup.py' install --optimize=1 --root="$pkgdir/" --prefix='/usr'
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/${pkgname}"
}
