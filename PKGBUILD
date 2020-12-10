# Maintainer: Alex DeLorenzo <alex at alexdelorenzo dot dev>
pkgname=chromecast_mpris
pkgver=0.6.3
pkgrel=1
pkgdesc="Control Chromecasts from Linux and D-Bus "
arch=('any')
url="https://github.com/alexdelorenzo/chromecast_mpris"
license=('AGPL3')
depends=('python>=3.6.0' 'python-gobject' 'python-pydbus' 'python-click')
makedepends=('git' 'python-pip')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	python3 -m pip install -r requirements.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python3 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

