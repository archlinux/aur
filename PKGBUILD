# Maintainer: aeneby <aaron (at) sowry (dot) nz>

pkgname=beansprout
pkgver=1.1.1
pkgrel=1
pkgdesc="A DWM-style tiling window manager with built-in wallpaper and a clock/bar"
arch=(x86_64)
url="https://codeberg.org/beansprout/beansprout"
license=(0BSD CC-BY-4.0 CC0-1.0 GPL-3.0-only HPND MIT Unlicense)
conflicts=($pkgname-git)
makedepends=(scdoc wayland-protocols zig)
depends=(fcft wayland libxkbcommon pixman)
source=("https://codeberg.org/beansprout/beansprout/archive/v${pkgver}.tar.gz")
sha256sums=('9175bc3865c45adeab7260d30836e90e4368461a094442a8ceb40111b6d578f5')

build() {
    cd "$srcdir/$pkgname"
    zig build -Doptimize=ReleaseSafe
}

package() {
    depends+=(river)
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" zig build -Doptimize=ReleaseSafe install
    install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSES/*
    install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname/examples" examples/config.kdl
}
