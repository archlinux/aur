# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thiefmd
pkgver=0.0.12
_codename=luminance
pkgrel=2
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64')
url="https://thiefmd.com"
license=('GPL3')
depends=('gtkspell3' 'webkit2gtk' 'discount' 'gtksourceview3' 'clutter' 'libarchive' 'libgee')
makedepends=('git' 'meson' 'vala' 'cmake' 'python-gobject')
provides=('libgxml-0.20.so=2.0.2-64')
conflicts=('gxml' 'ultheme-vala' 'libwritegood-vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kmwallio/ThiefMD/archive/v$pkgver-$_codename.tar.gz")
sha256sums=('af4f3317f42f2d68a30ba325260f8d515253b2c0bbeeeba87d32643e3e717b95')

build() {
	meson \
		--prefix /usr \
		--libexecdir lib \
		--sbindir bin \
		--buildtype plain \
		--auto-features enabled \
		-D b_lto=true \
		-D b_pie=true \
		ThiefMD-$pkgver-$_codename build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s /usr/bin/com.github.kmwallio.thiefmd "$pkgdir/usr/bin/$pkgname"
}
