# Maintainer: éclairevoyant
# Contributor: Sara <sara at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pdftxt
pkgver=0.7
pkgrel=5
pkgdesc="Simple wrapper around libmupdf to extract text from PDF files"
arch=(i686 x86_64)
url="https://litcave.rudi.ir"
license=(BSD)
depends=(freetype2 glibc gumbo-parser harfbuzz jbig2dec libjpeg-turbo openjpeg2 zlib)
makedepends=(libmupdf)
optdepends=('sh: mupdfgrep')
install=$pkgname.install
source=("$url/$pkgname-$pkgver.tar.gz"
        pdftxt-fix-flags.patch
        mupdfgrep
        $pkgname.LICENSE)
b2sums=('c5b1fcc39211ab99e56b6eea6dca3fdbde5c6e40f98ba2c7376d1a763f112da622e65751810d31a0fcf5e6136d8106cda3b44b9b1075fe57a064ec54f00c07a2'
        '4eb4c808ad3820a6e8456a259448b535eea87edc2a92290128f8871a0c9a92573974f1b017514cde2497ed014930d52c149023efd5e45c16b06131b3f2f97878'
        '528ebbe0da721b941762d4064fef5224a3017962b518f9d29742529b76ce3048b6564a473227bbc017dd5c48fc1a7d0b388e9122dfd6e7fa2fc1511280112e9f'
        'd90aaff927755ed9d945cace1b6beeac21a63cd6792fb874144eeea29a7fa040b66fe89d39b250fab817eab3c05d6ca0492cf1765494a4749a32ef48549deefd')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../pdftxt-fix-flags.patch
}

build() {
	make -C $pkgname-$pkgver
}

package() {
	install -Dm644 $pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 mupdfgrep -t "$pkgdir/usr/bin/"

	cd $pkgname-$pkgver
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}
