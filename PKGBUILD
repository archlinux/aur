# Maintainer: Saatvik <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=1.1.0
pkgrel=1
pkgdesc="A Wayland overlay that displays an animated bongo cat reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/saatvik333/wayland-bongocat"
license=('MIT')
depends=('wayland' 'glibc')
makedepends=('gcc' 'make' 'wayland-protocols' 'wayland')
optdepends=('hyprland: for automatic screen detection'
            'sway: compatible wayland compositor'
            'wayfire: compatible wayland compositor')
source=("wayland-bongocat-$pkgver.tar.gz::https://github.com/saatvik333/wayland-bongocat/archive/v$pkgver.tar.gz")
sha256sums=('6580ff932911ac2fb91f4577a4635376a3bba909a49c2abf01fe8ee0b15ce2a5')

build() {
    cd "$srcdir/wayland-bongocat-$pkgver"
    make release
}

package() {
    cd "$srcdir/wayland-bongocat-$pkgver"
    
    # Install the binary
    install -Dm755 bongocat "$pkgdir/usr/bin/bongocat"
    
    # Install example configuration
    install -Dm644 bongocat.conf "$pkgdir/usr/share/bongocat/bongocat.conf.example"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/bongocat/README.md"
    
    # Install assets for reference (optional)
    # install -Dm644 assets/demo.gif "$pkgdir/usr/share/doc/bongocat/demo.gif"
}
