# Maintainer: robotanarchy
# See also: https://github.com/voidlinux/void-packages/blob/master/srcpkgs/xbps/template

pkgname=xbps
pkgver=0.51
pkgrel=1
pkgdesc="Sick of systemd? Let's try out Void Linux!"
arch=('i686' 'x86_64')
url="https://github.com/voidlinux/xbps"
license=("custom:2-clause-BSD")
depends=("ca-certificates" "libarchive")
makedepends=("zlib" "openssl")
source=("https://github.com/voidlinux/xbps/archive/$pkgver.tar.gz")
md5sums=('8acd65768e3be3827841f3a5848a19d7')

build() {
	cd "$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--bindir=/usr/bin \
		--localstatedir=/var/lib/xbps
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 COPYING.3RDPARTY "$pkgdir/usr/share/licenses/$pkgname/COPYING.3RDPARTY"
}
