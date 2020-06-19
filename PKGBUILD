# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.5.1
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
sha256sums=('9f6feefa694e4baff7d42f1d781b3747d0e838b40f2a6a96b5ec83d8225c5c11')

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
