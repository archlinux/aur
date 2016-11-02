# Maintainer: TingPing <tingping@tingping.se>

pkgname='tartan'
pkgver=0.3.0
pkgrel=1
pkgdesc='Clang analysis plugin for GLib and GNOME'
url='https://people.collabora.com/~pwith/gnome-clang/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('llvm' 'clang' 'glib2' 'gobject-introspection')
source=("https://www.freedesktop.org/software/tartan/releases/tartan-$pkgver.tar.xz"
        'fix-clang-3.8.patch::https://cgit.freedesktop.org/tartan/patch/clang-plugin?id=53f9d7cbf5e0c0f9445e7e7af382a546de2f4a89')
sha256sums=('008f8195de142900443f10d7a0a1e5a0360c1296e5684274fa39c148a161c731'
            '785445a36752a87934d9d3d32df39cd2af8aba70c25f6f72bd34f7194b46501f')

prepare() {
	cd "$pkgname-$pkgver"

	patch -p1 < "$srcdir/fix-clang-3.8.patch"
}

build() {
	cd "$pkgname-$pkgver"

	./autogen.sh --prefix=/usr
	sed -i 's|^#define NDEBUG|//|' config.h
	make
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR=$pkgdir make install
}
