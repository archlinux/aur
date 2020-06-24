# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.5.5
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'gobject-introspection' 'gtk3' 'gst-plugins-good' 'libnm'
         'python-pillow>=7.1.2' 'python-logbook' 'python-single-version'
         'python-zbar')
makedepends=('meson' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c14e09efd6575bb73f9e68247b73aed04364bb648a1b497d8b0f4b0c98d0cb44')

build() {
	cd "CoBang-$pkgver"
	arch-meson . build
	python setup.py build
}

package() {
	cd "CoBang-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
