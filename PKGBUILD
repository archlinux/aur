# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=controku
pkgver=1.1.0
pkgrel=1
pkgdesc="Control Roku devices from the comfort of your own desktop"
arch=('any')
url="https://github.com/benthetechguy/controku"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-requests' 'python-appdirs' 'python-ssdpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/benthetechguy/controku/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('97bccaeb45779ee843709bc478ac40de69551414545509f8753cfe9aa87af407')

build() {
	cd controku-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd controku-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 controku.desktop "$pkgdir/usr/share/applications/controku.desktop"
	install -Dm644 controku/images/controku.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/controku.png"
}
