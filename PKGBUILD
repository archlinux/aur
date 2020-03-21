# Maintainer: Космическое П. <kosmospredanie@yandex.ru>

pkgname=gpseq-git
pkgver=0.4.0.alpha.r0.c996a96
pkgrel=1
pkgdesc="A parallelism library for Vala and GObject"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/kosmospredanie/gpseq"
license=('LGPL3')
depends=('libgee')
makedepends=('vala' 'meson' 'git' 'gobject-introspection')
# provides=("gpseq")
# conflicts=("gpseq")
source=('gpseq::git+https://gitlab.com/kosmospredanie/gpseq.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/gpseq"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/gpseq"
	meson _build --buildtype=release --prefix=/usr -Dtypelib=true -Ddocs=valadoc,gtkdoc
	ninja -C _build
}

package() {
	cd "$srcdir/gpseq"
	DESTDIR="$pkgdir" ninja -C _build install
	install -Dm644 ./COPYING "$pkgdir/usr/share/licenses/gpseq/COPYING"
	install -Dm644 ./COPYING-libgee "$pkgdir/usr/share/licenses/gpseq/COPYING-libgee"
}
