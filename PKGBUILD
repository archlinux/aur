# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='repath'
pkgname="python-${_pkgname}"
pkgver=0.9.0 # From https://pypi.org/project/repath/, although it isn't tagged on github.
pkgrel=2
pkgdesc='Parses express-style paths to PCRE regular expression patterns.'
arch=(any)
url="https://github.com/nickcoutsos/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
sha256sums=('SKIP')
source=("git+${url}.git#commit=a9ab3136bb05abafb44811d60c87f9d1d035197a")

_srcdir="$pkgname"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/${pkgname}"
}
