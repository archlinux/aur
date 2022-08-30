# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=python-telegram
pkgver=0.16.0
pkgrel=1
pkgdesc="Python API for the tdlib library. It helps you build your own Telegram clients."
arch=(any)
url="https://github.com/alexander-akhmetov/python-telegram"
license=('MIT')
depends=('python3' 'libtd>=1.8.5' 'python-setuptools')
conflicts=('python-telegram-bot')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexander-akhmetov/$pkgname/archive/$pkgver.tar.gz")
md5sums=('ce8958353e5d87b213c38d0b21d59813')

prepare() {
	cd "${pkgname}-${pkgver}"
	rm -r telegram/lib
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
