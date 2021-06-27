# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=virtscreen
pkgver=0.3.1
pkgrel=2
pkgdesc="Make your iPad/tablet/computer as a secondary monitor on Linux"
arch=('any')
url="https://github.com/kbumsik/VirtScreen"
license=('GPL3')
depends=('xorg-xrandr' 'x11vnc' 'python-pyqt5' 'qt5-quickcontrols2' 'python-quamash' 'python-netifaces')
makedepends=('python-setuptools')
optdepends=('arandr: for display settings option')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        '001-remove-pyqt5.patch')
sha256sums=('345c9333a0129db660d07687fbfa479fd69bf9fe387510b987207463c7a55257'
            '95772f671ff329e3e7ef791999dc9f131647bc0f92c3a23e43813399659c62c9')

prepare() {
	cd "VirtScreen-$pkgver"
	patch -p1 < "$srcdir/001-remove-pyqt5.patch"
}

build() {
	cd "VirtScreen-$pkgver"
	python setup.py build
}

package() {
	cd "VirtScreen-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
