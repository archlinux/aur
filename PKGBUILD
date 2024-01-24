# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=telegram-text
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=1
pkgdesc="Python markup module for Telegram messenger"
arch=(any)
url="https://telegram-text.alinsky.tech/"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SKY-ALIN/telegram-text/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1af4e5487858dcc2576946524193f97e0638335c0b307ef3f2adfc6bebde0192')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname-$pkgver"
	pytest tests/
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
