# Maintainer: Alex S. <alex at panoptic.onl>
pkgname=cryptlib
pkgver=3.4.5
_pkgverdotless=345
pkgrel=1
pkgdesc="A high-level security interface toolkit providing encryption and authentication"
# This description is awful but it's a hard toolkit to summarize.
arch=('x86_64' 'i686')
url="https://www.cs.auckland.ac.nz/~pgut001/cryptlib/"
license=('custom:sleepycat')
depends=(zlib)
makedepends=(unzip
	make)
source=("https://cryptlib-release.s3-ap-southeast-1.amazonaws.com/$pkgname$_pkgverdotless.zip")
noextract=("$pkgname$_pkgverdotless.zip")
sha256sums=('7b757a41b2e146d6b5676936eab51526396d2058c0263e613e3795041e240c31')
prepare(){
	unzip -a $pkgname$_pkgverdotless.zip
}
build() {
	cd "$srcdir/"
	make shared
}
check() {
	cd "$srcdir/"
	make stestlib
}
package() {
	cd "$srcdir/"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make PREFIX=/usr/ DESTDIR="$pkgdir" install
}