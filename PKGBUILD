# Maintainer: Shantanu Baddar <shantanubaddar2006@gmail.com>
pkgname=hyprwave
pkgver=1.0
pkgrel=1
pkgdesc="A sleek music control bar for Wayland compositors with MPRIS integration, audio visualizer, and 14 themes"
arch=('x86_64')
url="https://github.com/shantanubaddar/hyprwave"
license=('GPL-3.0-only')
depends=('gtk4' 'gtk4-layer-shell' 'libpulse' 'glib-networking')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c19e60887a897de3474fa7d5f4f3396cc423ac6a91254e12c1b3e2df1707900')

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
    cp -r fonts "$pkgdir/usr/share/hyprwave/"
    install -Dm644 style.css "$pkgdir/usr/share/hyprwave/style.css"
    install -Dm644 style-layout.css "$pkgdir/usr/share/hyprwave/style-layout.css"
    
    # Install themes
    install -dm755 "$pkgdir/usr/share/hyprwave/themes"
    install -Dm644 themes/*.css "$pkgdir/usr/share/hyprwave/themes/"
    
    # Install default config as example
    install -Dm644 config.conf "$pkgdir/usr/share/doc/$pkgname/config.conf.example"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
