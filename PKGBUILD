# Maintainer: ethanrakoff

pkgname=basez
pkgver=1.6.2
pkgrel=3
pkgdesc='En/decodes base16/32/64, including RFC-compliant URL, MIME, PEM encodings'
arch=(x86_64)
url="https://salsa.debian.org/debian/$pkgname"
depends=(glibc)
makedepends=()
license=(GPL3 CCPL:by-sa BSD)
source=("$url/-/archive/debian/$pkgver-$pkgrel/$pkgname-debian-$pkgname-$pkgrel.tar.gz")
sha256sums=('006703588c2a519195cfc09a2148731f07264fba803f4e36c83a8b5ef99d1098')
validpgpkeys=('2C5CF8210CDF553B9521DE76223AE055BD94E154') # Milan Kupcevic <milan@debian.org>

build() {
	cd $pkgname-debian-$pkgver-$pkgrel-6f6d280ea682513469ac778ae47f1145b6e201bc
	./configure --prefix=/usr --disable-base64-command --disable-base32-command
	make
}

package() {
	cd $pkgname-debian-$pkgver-$pkgrel-6f6d280ea682513469ac778ae47f1145b6e201bc
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
