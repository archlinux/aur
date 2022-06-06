# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=mtkclient
pkgver=1.52
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
arch=('any')
url="https://github.com/bkerler/mtkclient"
license=('GPL')
depends=('libusb' 'python' 'python-pyusb' 'python-pycryptodome' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
install=mtkclient.install
source=("https://github.com/bkerler/mtkclient/archive/refs/tags/$pkgver.tar.gz"
        "usb.patch")
sha256sums=('5a9363cdcb65392ed4dd19f8442d73f0560d2195b67e790abcee7d7ea34e9ff2'
            '0ed1a391ae22bc5bed99ecd922d70b37ed4a9658613eb16831b0573d2c77b5ef')

prepare() {
	cd mtkclient-$pkgver
	# Remove problematic "usb" dependency (package already depends on pyusb)
	cat ../usb.patch | patch -p1
}

build() {
	cd mtkclient-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd mtkclient-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
