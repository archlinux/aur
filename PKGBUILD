# Maintainer: El Bachir <bachiralfa@gmail.com>

pkgname=sxwm
pkgver=1.6
pkgrel=4
pkgdesc="Tiling window managers don't have to be difficult"
arch=('i686' 'x86_64')
url="https://github.com/uint23/sxwm"
license=('MIT')
depends=('libx11' 'libxinerama' 'libxcursor')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uint23/sxwm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('490700121bb0ecba1b8731a39a08fa03fca15349e5b2703b1f5a65fda3ceee86')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make LDFLAGS="-lX11 -lXinerama -lXcursor"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 sxwm "$pkgdir/usr/bin/sxwm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 default_sxwmrc "$pkgdir/usr/share/doc/$pkgname/sxwmrc"
}

post_install() {
	msg2 "==> NOTE: The example config is located at /usr/share/doc/sxwm/sxwmrc"
}
