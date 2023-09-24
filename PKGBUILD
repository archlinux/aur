# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=simplematrixbotlib
pkgname="python-$_pkgname"
pkgver=2.10.1
pkgrel=1
pkgdesc="An easy to use bot library for the Matrix ecosystem written in Python"
arch=(any)
url="https://codeberg.org/imbev/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry')
depends=('python-matrix-nio' 'python-cryptography-fernet-wrapper' 'python-pillow' 'python-markdown'
         'python-toml')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2b9d6d3ad43dcab96880eaac9ec215a953c655344b3f698dedd7e5c55eddc3a6')

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
