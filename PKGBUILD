# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.6.2
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'python-gobject' 'gst-plugin-gtk' 'libnm'
         'python-pillow' 'python-logbook' 'python-single-version' 'zbar'
         'python-kiss-headers')
makedepends=('meson' 'gobject-introspection' 'python-setuptools' 'python-babel-glade')
#checkdepends=('apstream-util')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1fc5e99897c5cfae3353a05d34eb871e584a284e2abec9a80735726076bc5c6c')

build() {
	arch-meson CoBang-$pkgver build
	meson compile -C build
}

#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	export PYTHONHASHSEED=0
	DESTDIR="$pkgdir" meson install -C build

	cd CoBang-$pkgver
	for l in fil id it lo ms my nl th vi; do # kh missing
		install -Dm644 "po/$l/LC_MESSAGES/$pkgname.mo" -t \
			"$pkgdir/usr/share/locale/$l/LC_MESSAGES"
	done
}
