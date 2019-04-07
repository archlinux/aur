# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=dmg2img
pkgver=1.6.7
pkgrel=3
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
	""
	""
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
