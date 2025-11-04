# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='neotermcolor'
pkgname="python-$_projectname"
pkgver='2.0.11'
_commit='3ead172100bf374a60eec57a5080384801d03f47'
pkgrel='1'
pkgdesc='Modern ANSII Color formatting for output in terminal'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('17322855d1bc686c05328fb078271568599fb41ec743fedfda0e9871ce1135a1c895d430003d1ae15f2ad3ca63a8b82f818c39d820f0c330922de27fd847d52b')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python test.py
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
