# Maintainer: Shantanu Baddar <shantanubaddar2006@gmail.com>
pkgname=hyprwave
pkgver=0.9
pkgrel=1
pkgdesc="A sleek music control bar for Wayland compositors with MPRIS integration and audio visualizer"
arch=('x86_64')
url="https://github.com/shantanubaddar/hyprwave"
license=('GPL-3.0-only')
depends=('gtk4' 'gtk4-layer-shell' 'libpulse')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5aa106470c6e5cfebf9d05e1bcaa2b469ee427360bccc73be969b42735550efa')

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
    
    # Install default config as example
    install -Dm644 -D config.conf "$pkgdir/usr/share/doc/$pkgname/config.conf.example"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
