# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: TingPing <tingping@tingping.se>

pkgname=retro-gobject
pkgver=0.6
pkgrel=2
pkgdesc='A GObject based Libretro wrapper for frontends'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/Kekun/retro-gobject'
depends=('glib2')
optdepends=('retro-plugins-snes')
makedepends=('gobject-introspection' 'intltool' 'libtool' 'vala')
source=("https://github.com/Kekun/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('48716a347a836d99f3befc9024437a345a64579dec3e6ddccee040bde6c434ba')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's/@version@/0.6/' retro-gobject/retro-gobject-0.6.pc.in
}

build() {
	cd "$pkgname-$pkgver"

	./autogen.sh --prefix=/usr --enable-introspection
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
