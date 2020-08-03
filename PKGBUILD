# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.5.6+4+ga54f716
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'gobject-introspection' 'gtk3' 'gst-plugins-good' 'libnm'
         'python-pillow>=7.1.2' 'python-logbook' 'python-single-version'
         'python-zbar' 'python-kiss-headers')
makedepends=('meson' 'python-setuptools')
_commit='a54f71683fcf6403962923f95601cd676a03788e'
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
