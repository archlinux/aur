# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=controku
pkgver=1.0.0
pkgrel=1
pkgdesc="Control Roku devices from the comfort of your own desktop"
arch=('any')
url="https://github.com/benthetechguy/controku"
license=('GPL')
depends=('gtk3' 'python-gobject' 'python-requests' 'python-appdirs' 'python-ssdpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/benthetechguy/controku/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('05287b8998ef232f487e95f0231496e9d1c80d87f4b798c2dd3d392e7eb63393')

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
