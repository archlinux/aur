# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.5.2
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
sha256sums=('8f3fd8a8f7c6abb329205c146920aca650a17e02eb4365cf0a21a6d91ce6268d')

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
