# $Id: PKGBUILD 162349 2016-02-18 12:04:33Z seblu $
# Maintainer: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston
pkgver=1.10.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=('i686' 'x86_64')
url='http://wayland.freedesktop.org'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libinput' 'libunwind' 'poppler-glib' 'mtdev' 'libxcursor' 'glu' 'pango' 'colord')
makedepends=('wayland-protocols')
source=("http://wayland.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha1sums=('c9c2c8e2e798b25e7bf6b31bf0c4ef08724a7ebb')

build() {
	cd $pkgname-$pkgver
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/weston \
		--enable-libinput-backend \
		--enable-demo-clients-install
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
	# license
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
