# Maintainer: TingPing <tingping@tingping.se>

pkgname=libgrss
pkgver=0.6
pkgrel=2
pkgdesc="A Glib-based library to manage RSS and Atom feeds	"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/Libgrss"
license=('LGPL3')
depends=('glib2' 'libsoup' 'libxml2')
makedepends=('gnome-common' 'gtk-doc' 'gobject-introspection' 'intltool')
source=("https://git.gnome.org/browse/libgrss/snapshot/$pkgname-$pkgver.tar.xz"
        '0001-Install-GIR-files-into-proper-directories.patch')
sha256sums=('69136ed91d28ec393143c4f2128fa93c127147f09cec6b1172f2f23717337d6e'
            'e3109812ee8e66919bfbb53dcd596f76b923fa573277a4b0b9ee1afba9daef8d')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../0001-Install-GIR-files-into-proper-directories.patch
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh --prefix=/usr --enable-gtk-doc --enable-introspection
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
