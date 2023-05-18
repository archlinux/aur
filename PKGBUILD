# Maintainer: éclairevoyant
# Contributor: Kyle Keen <keenerd at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux dot us>

pkgname=tty-clock
pkgver=2.3
pkgrel=2
pkgdesc="Digital clock in ncurses"
arch=(i686 x86_64)
url="https://github.com/xorg62/$pkgname"
license=(BSD)
depends=(glibc ncurses)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        0001-include-format-specifier-in-printf.patch
        $pkgname.LICENSE)
b2sums=('16e764c6321407ba1a4545de6f7aeb5b1b1f3e0d94d2e05ef9a95a20bc178b11962518a946aa292f35be0a293d12e3739353d2da80358e86d4bf9c29983a81d6'
        '07f2c0ff6eb327ddc2dbf93378ce1c2e4b214f84596c8a0550e85d125d6f7cdf3a0daf52a6ea39b0f25f1f4e6995652babbcca39fb32acf22a7e2e9b46130757'
        'af8bab79f40f29e7020a9e977be72f71cf00a3864aa9461058343e662f8fa87fc0c6cc8421649d6ff4adbede47f9f2af28fb6958a60db8aa41d111e09481da47')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../0001-include-format-specifier-in-printf.patch
}

build() {
	make -C $pkgname-$pkgver
}

package() {
	install -Dm644 $pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd $pkgname-$pkgver
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
	install -Dm655 $pkgname.1 -t "$pkgdir/usr/share/man/man1/"
}
