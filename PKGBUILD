# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=bacnet-stack
pkgver=0.8.6
pkgrel=1
pkgdesc="BACnet protocol stack and diagnostic tools (bacrp, bacwp, etc.)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/bacnet/"
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=()
makedepends=()
options=()
source=('https://sourceforge.net/projects/bacnet/files/bacnet-stack/bacnet-stack-0.8.6/bacnet-stack-0.8.6.tgz')
md5sums=('544ebd42ed959deb2213209b66bbc460')
sha256sums=('ca649baa5519e5da6611a29759712feaab93ec4619ae197fe08038de1d3dcec1')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	# `make all` fails as it's not parallel compatible, so just make the sub
	# parts that are.
	make ${MAKEFLAGS} library
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -d "$pkgdir/usr/lib"
	install -m 644 -t "$pkgdir/usr/lib" lib/*.a

	install -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" `find bin -executable -type f`
}
