# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=telegram-text
pkgname=python-$_pkgname
pkgver=0.1.2
pkgrel=1
pkgdesc="Python markup module for Telegram messenger"
arch=(any)
url="https://telegram-text.alinsky.tech/"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SKY-ALIN/telegram-text/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41c12d71fbb78caf50af271ba5fc3372cf25177fa4ba9c8eee20960bbc1c5260')

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
