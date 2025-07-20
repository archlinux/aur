# Maintainer: Lambda <aur@xiretza.xyz>
_pkgname=python-panoramisk
pkgname=$_pkgname-git
pkgver=1.4.r43.d0df36b
pkgrel=1
pkgdesc="asyncio based library to play with asterisk"
arch=(any)
url="https://github.com/gawel/panoramisk"
license=('MIT')
depends=('python' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_pkgname"
	pytest
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
