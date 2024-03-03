# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=simplematrixbotlib
pkgname="python-$_pkgname"
pkgver=2.11.0
pkgrel=1
pkgdesc="An easy to use bot library for the Matrix ecosystem written in Python"
arch=(any)
url="https://codeberg.org/imbev/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry')
depends=('python' 'python-matrix-nio' 'python-cryptography-fernet-wrapper' 'python-pillow' 'python-markdown'
         'python-toml')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9b9aa901f53b532ddcc2991e6e014023f3be43f52806ae97e8ded0235f102f9d')

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
