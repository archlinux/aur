# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=blanket
pkgver=0.1.0+11+g208c67a
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('x86_64')
url="https://github.com/rafaelmardojai/blanket"
license=('GPL3')
depends=('gtk3' 'gst-python' 'python-gobject' 'libhandy')
makedepends=('meson')
_commit=208c67a5687a471b74978f63943f83ffb61600b0
source=("git+https://github.com/rafaelmardojai/blanket.git#commit=$_commit")
sha256sums=('SKIP')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
#sha256sums=('b67d887975bbfa766e5e831cd7667b3e45359399c875b5717eb071b7ab526935')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/-/+/g'
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
