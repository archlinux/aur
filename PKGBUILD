# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=mtkclient
pkgver=1.63
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
arch=('any')
url="https://github.com/bkerler/mtkclient"
license=('GPL')
depends=('libusb' 'python' 'python-pyusb' 'python-pyserial' 'python-pycryptodome' 'python-colorama' 'python-mock' 'shiboken6' 'pyside6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
install=mtkclient.install
source=("https://github.com/bkerler/mtkclient/archive/refs/tags/$pkgver.tar.gz"
        "usb.patch")
sha256sums=('ae9332e69ffee4331f11bc8a99f0f8d14073be6fbfad13b38f89fc71c0bae1ee'
            '953b4111910056208b032573b0c34d886490efda06ada46f9718a70d15f891d2')

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
