# Maintainer: queueRAM <queueRAM@gmail.com>
pkgname=hydan
pkgver=0.13
pkgrel=2
pkgdesc="steganographically conceal messages in 32-bit applications"
arch=('i686' 'x86_64')
url="http://www.crazyboy.com/hydan/"
license=('unknown')
depends=('openssl')
source=("http://www.crazyboy.com/hydan/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
sha256sums=('47f295a20c6a07fa0c244b48ab506067a981fc780305c307b8f345b6b6302023'
            '6e98805eef28a907a124cd3687e39b463be3b5dbd13034ae06234f662557fefd')

prepare() {
	cd "$pkgname"
   # patch for opaque struct changes in openssl 1.1.0+
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname"
	make CFLAGS="$CFLAGS -I$srcdir/$pkgname/libdisasm/src/arch/i386/libdisasm -DVARBITS"
}

package() {
	cd "$pkgname"
   install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
   ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname-decode"
   ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname-stats"
   install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
   install -Dm644 README.details "$pkgdir/usr/share/$pkgname/README.details"
}
