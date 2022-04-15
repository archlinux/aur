# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=simplematrixbotlib
pkgname="python-$_pkgname"
pkgver=2.6.3
pkgrel=1
pkgdesc="An easy to use bot library for the Matrix ecosystem written in Python"
arch=(any)
url="https://github.com/i10b/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry')
depends=('python-matrix-nio' 'python-cryptography-fernet-wrapper' 'python-pillow' 'python-markdown'
         'python-toml')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63b889140455ac9075445185b16e07159e065751a8e009c8f566c91a7670bcd3')

build() {
	cd "$_pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname-$pkgver"

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
