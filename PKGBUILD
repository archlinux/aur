# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.5.6+6+g76b8bf2
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'python-gobject' 'gst-plugin-gtk' 'libnm'
         'python-pillow>=7.1.2' 'python-logbook' 'python-single-version' 'zbar'
         'python-kiss-headers')
makedepends=('meson' 'python-setuptools' 'gobject-introspection')
_commit='76b8bf216c9dd5d41c9867ab8ed87ec5073fe963'
source=("$pkgname::git+https://github.com/hongquan/CoBang.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
