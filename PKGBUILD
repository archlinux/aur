# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=apt-offline
pkgver=1.8.4
pkgrel=2
pkgdesc="Offline APT Package Manager"
arch=('any')
url="https://rickysarraf.github.io/apt-offline/"
license=('GPL')
depends=('python3' 'python-pyqt5')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickysarraf/apt-offline/releases/download/v$pkgver/apt-offline-$pkgver.tar.gz"
	"0001-Use-modern-threading-api.patch")
sha256sums=('c6f4afae6082d1eeada7791793ae29ec02a2444b95edfa46956a0299878c3882'
            '7974748142903b8d3968b87770995cd3a856eab18553f6044fb7ed4eaed3ceca')

prepare() {
	cd "$pkgname"
	patch -p1 -i"$srcdir/0001-Use-modern-threading-api.patch"
}

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
