# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.6.0+1+g9d6342f
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'python-gobject' 'gst-plugin-gtk' 'libnm'
         'python-pillow>=7.1.2' 'python-logbook' 'python-single-version' 'zbar'
         'python-kiss-headers')
makedepends=('meson' 'python-setuptools' 'gobject-introspection')
_commit='9d6342fe496e0af4647d838a2ae5bfa74fa53342'
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
