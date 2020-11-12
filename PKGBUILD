# Maintainer: Jona Miller <miller.jona at yandex dot com>
pkgname=onhold
pkgver=0.3.3
pkgrel=1
pkgdesc="Control Chromecasts from Linux and D-Bus "
arch=('any')
url="https://github.com/alexdelorenzo/chromecast_mpris"
license=('AGPL3')
depends=('python>=3.6.0')
makedepends=('git' 'python-pip' 'python-gobject')
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

