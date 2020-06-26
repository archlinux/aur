# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.5.6
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'gobject-introspection' 'gtk3' 'gst-plugins-good' 'libnm'
         'python-pillow>=7.1.2' 'python-logbook' 'python-single-version'
         'python-zbar')
makedepends=('meson' 'python-setuptools')
#checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5b4504c40b313891fddedd78dac9fcd1b3e4c8c9bae68f998cc4ba4e6ac9ba33')

build() {
	cd "CoBang-$pkgver"
	arch-meson . build
	meson compile -C build

	python setup.py build
}

#check() {
#	cd "CoBang-$pkgver"
#	meson test -C build
#}

package() {
	cd "CoBang-$pkgver"
	DESTDIR="$pkgdir" meson install -C build

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
