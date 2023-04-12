# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=python-telegram
pkgver=0.18.0
pkgrel=1
pkgdesc="Python API for the tdlib library. It helps you build your own Telegram clients."
arch=(any)
url="https://github.com/alexander-akhmetov/python-telegram"
license=('MIT')
depends=('python3' 'libtd>=1.8.5' 'python-setuptools' 'python-telegram-text>=0.1')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('python-telegram-bot')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexander-akhmetov/$pkgname/archive/$pkgver.tar.gz")
md5sums=('975333bb4336e764aca80d9070d4b33f')

prepare() {
	cd "${pkgname}-${pkgver}"
	rm -r telegram/lib
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
