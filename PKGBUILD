# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=python-telegram
pkgver=0.15.0
pkgrel=1
pkgdesc="Python API for the tdlib library. It helps you build your own Telegram clients."
arch=(any)
url="https://github.com/alexander-akhmetov/python-telegram"
license=('MIT')
depends=('python3' 'libtd>=1.7.9')
conflicts=('python-telegram-bot')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexander-akhmetov/$pkgname/archive/$pkgver.tar.gz"
	"0001-Use-system-tdlib.diff"
	"0002-Remove-binarys.diff")
md5sums=('860bf09e9ac3e9009d9947a01dde6f88'
         '287acb342038ba44bb86cdc2c6cb303b'
         'c9085c229e25cab11bffd1431c220ef1')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i ${srcdir}/0001-Use-system-tdlib.diff
	patch -p1 -i ${srcdir}/0002-Remove-binarys.diff
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
