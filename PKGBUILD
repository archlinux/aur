# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=oryx-kb-leds
pkgver=1.1
pkgrel=1
pkgdesc="Control your Oryx Pro's Keyboard LEDs"
arch=('x86_64')
url="https://github.com/davemcphee/oryx-kb-leds"
license=('GPL3')
depends=('python-colour' 'python-psutil' 'python-pyaml')
makedepends=('python-setuptools')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d1ebeaf7464147beb3dba36e629b0e0afe5e31c6243cef298998eb2afe240a16')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	
	install -Dm644 systemd/oryxkbleds.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
