# Maintainer: Shantanu Baddar <shantanubaddar2006@gmail.com>

pkgname=hyprwave
pkgver=0.6
pkgrel=1
pkgdesc="A sleek music control bar for Wayland compositors with MPRIS integration"
arch=('x86_64')
url="https://github.com/shantanubaddar/hyprwave"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a46d1a9f6fb4db9c77678fcc28ffefadc8f89bf1874c6664ca5b6eb3629dc5e')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 hyprwave "$pkgdir/usr/bin/hyprwave"

    # Install toggle helper
    install -Dm755 hyprwave-toggle.sh "$pkgdir/usr/bin/hyprwave-toggle"

    # Install resources
    install -dm755 "$pkgdir/usr/share/hyprwave"
    cp -r icons "$pkgdir/usr/share/hyprwave/"
    install -Dm644 style.css "$pkgdir/usr/share/hyprwave/style.css"
    install -Dm644 config.conf "$pkgdir/usr/share/hyprwave/config.conf"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
