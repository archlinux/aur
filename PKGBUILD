# Maintainer: Hector Mtz-Seara <hseara at gmail dot com>

pkgname=dssp
pkgver=2.2.1
pkgrel=3
pkgdesc="Secondary structure assignment for proteins"
arch=('i686' 'x86_64')
url="http://swift.cmbi.ru.nl/gv/dssp/HTML/distrib.html"
license=('custom')
depends=('boost-libs')
source=("$pkgname-$pkgver.tar.gz::ftp://ftp.cmbi.ru.nl/pub/software/$pkgname/$pkgname-$pkgver.tgz")
sha1sums=('b0fe1b2a4c5c04efaac9f89442fa6f2947ff75b7')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        sed -i 's/-static//' makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
        sed -i 's:$(DEST_DIR)/man/man1:$(DEST_DIR)/share/man/man1/:' makefile
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DEST_DIR="${pkgdir}/usr" install
        install -D -m0644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/dssp/LICENSE"
}

