# Maintainer: Jona Miller <miller.jona at yandex dot com>
pkgname=onhold
pkgver=0.6.4
pkgrel=1
pkgdesc="A command-line utility that allows you to play music while a long job completes"
arch=('any')
url="https://github.com/alexdelorenzo/onhold"
license=('AGPL3')
depends=('python>=3.6.0')
makedepends=('python-pip')
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
