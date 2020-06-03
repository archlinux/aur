# Maintainer: koraynilay <bat3ko.f@gmail.com>
pkgname=scrnsvr
pkgver=1.0
pkgrel=1
pkgdesc="X Screensaver/locker"
arch=('x86_64')
url="https://github.com/koraynilay/scrnsvr"
license=('WTFPL')
depends=('pulseaudio' 'wmctrl' 'grep' 'procps-ng' 'libxss')
makedepends=('git' 'gcc')
conflicts=('scrnsvr-bin')
source=("$pkgname-$pkgver::git+https://github.com/koraynilay/scrnsvr")
optdepends=('dunst: dunstify for notifications' 'notify-send: for notifications')
md5sums=("SKIP")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	gcc -g -O0 -Wl,-z,relro,-z,now scrnsvr.c -o scrnsvr -lXss -lX11 -lpthread
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 scrnsvr "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/scrnsvr/LICENSE"
}
