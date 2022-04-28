# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=apt-offline
pkgver=1.8.4
pkgrel=1
pkgdesc="Offline APT Package Manager"
arch=('any')
url="https://rickysarraf.github.io/apt-offline/"
license=('GPL')
depends=('python3' 'python-pyqt5')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickysarraf/apt-offline/releases/download/v$pkgver/apt-offline-$pkgver.tar.gz")
sha256sums=('c6f4afae6082d1eeada7791793ae29ec02a2444b95edfa46956a0299878c3882')

build() {
	cd "$pkgname"
	make build
	gzip "$pkgname.8"
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 "$pkgname-gui.desktop" "$pkgdir/usr/share/applications/$pkgname-gui.desktop"
	install -Dm644 "$pkgname.8.gz" "$pkgdir/usr/share/man/man8/$pkgname.8.gz"
}
