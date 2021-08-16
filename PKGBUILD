# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=akira
pkgver=0.0.16
pkgrel=1
pkgdesc='Native Linux App for UI and UX Design built in Vala and Gtk'
arch=(x86_64 aarch64)
url="https://github.com/akiraux/${pkgname^}"
license=(GPL3)
depends=(elementary-icon-theme
         goocanvas
         gtk-theme-elementary
         gtksourceview3
         libarchive
         granite)
makedepends=(appstream
             meson
             vala)
_archive="${pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7740358ac2cd5de2a1d7a4c7cbd25a852c2dcb6b71f442a0280b160f6f4c6ada')

build() {
	arch-meson "$_archive" build
	ninja -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	pushd "$pkgdir/usr/bin"
	ln -s com.github.akiraux.akira akira
}
