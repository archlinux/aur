# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=vwm-git
pkgver=r26.e93cd9f
pkgrel=1
pkgdesc="Lightweight tiling window manager for X11"
arch=('x86_64')
url="https://github.com/veasman/vwm"
license=('MIT')
depends=('libx11' 'libxcb' 'xcb-util-wm' 'xcb-util-keysyms' 'libxft' 'fontconfig' 'cairo' 'libxrender' 'libxext')
makedepends=('base-devel' 'git' 'pkgconf')
provides=('vwm')
conflicts=('vwm')
source=('git+https://github.com/veasman/vwm.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/vwm"
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/vwm"
	make
}

package() {
	cd "$srcdir/vwm"
	make DESTDIR="$pkgdir" PREFIX=/usr DATADIR=/usr/share install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
