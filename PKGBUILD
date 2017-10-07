# Maintainer: Henrik Holst <hholst80@gmail.com>
# Patch from here:
# https://bz-attachments.freebsd.org/attachment.cgi?id=155711&action=diff&format=raw&headers=1
pkgname=eukleides
pkgver=1.5.4
pkgrel=1
epoch=
pkgdesc="Eukleides is a computer language devoted to elementary plane geometry."
arch=(x86_64)
url="http://eukleides.org/"
license=('GPL')
groups=()
depends=()
makedepends=(gcc make texinfo)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://eukleides.org/files/$pkgname-$pkgver.tar.bz2" "$pkgname-$pkgver.patch")
noextract=()
md5sums=(2c88fc857008c2ce23c7848c60621548 ab133aa2149f27e0b99a3536f26af411)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
	sed -i "s@^PREFIX *=.*@PREFIX=$pkgdir/usr/@" Config
	# sed -i "s@^PAPER *=.*@PAPER=LETTER@" Config
	sed -i "s@ginstall-info@install-info@" doc/Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make install
}
