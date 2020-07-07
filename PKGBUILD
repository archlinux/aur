# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=dmg2img
pkgver=1.6.7
pkgrel=4
pkgdesc="A CLI tool to uncompress Apple's compressed DMG files to the HFS+ IMG format"
arch=("i686" "x86_64")
url="http://vu1tur.eu.org/tools/"
license=("GPL2")
depends=("openssl" "bzip2")
source=(
	"http://vu1tur.eu.org/tools/$pkgname-$pkgver.tar.gz"
	"0001-openssl-1.1-compatibility.patch"
)
sha256sums=(
	"02aea6d05c5b810074913b954296ddffaa43497ed720ac0a671da4791ec4d018"
	"021f14fc5f3b8dc058b604c6e3be6401124e4cc715df4c7f08a1175ef7e5183b"
)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 --ignore-whitespace -i "$srcdir/0001-openssl-1.1-compatibility.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
