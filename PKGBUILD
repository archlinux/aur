# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='shd'
pkgname="$_pkgname-git"
pkgver='r26.166aa73'
pkgrel='1'
pkgdesc='Console tool to display drive list with commonly checked smart info - git version'
arch=('any')
url="https://github.com/alttch/$_pkgname"
license=('MIT')
depends=('python' 'python-neotermcolor' 'python-pysmart' 'python-rapidtables' 'smartmontools')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
