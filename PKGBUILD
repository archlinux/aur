# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=wimlib
pkgver=1.8.1
pkgrel=2
pkgdesc="A library and program to extract, create, and modify WIM files"
arch=("i686" "x86_64")
url="http://wimlib.net"
license=("custom")
depends=("openssl" "fuse" "libxml2" "ntfs-3g" "attr")
optdepends=("cdrkit: for making ISO image of Windows PE"
	"mtools: for making disk image of Windows PE"
	"syslinux: for making disk image of Windows PE"
	"cabextract: for extracting Windows PE from the WAIK"
	"ntfsprogs: for making NTFS filesystems")
checkdepends=("ntfsprogs")
source=("http://wimlib.net/downloads/$pkgname-$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	./configure --with-libcrypto --with-fuse --with-ntfs-3g --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	for file in NEWS README*; do
		install -Dm644 $file "$pkgdir/usr/share/doc/$pkgname/$file"
	done
	for file in COPYING*; do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}

sha1sums=('919eec5f226932b492cb54c00a9a2aacbf480b82')
