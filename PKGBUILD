# Maintainer: Saatvik <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=1.2.2
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
sha256sums=('6f5feb1fde7aaf4c9375bf30f8806a74e3ad9f5da5f45afede67c021dfc74cff')

build() {
    cd "$srcdir/wayland-bongocat-$pkgver"
    make release
}

package() {
    cd "$srcdir/wayland-bongocat-$pkgver"

    # Install the binary
    install -Dm755 build/bongocat "$pkgdir/usr/bin/bongocat"

    # Install example configuration
    install -Dm644 bongocat.conf "$pkgdir/usr/share/bongocat/bongocat.conf.example"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/bongocat/README.md"

    # Install find_input_devices.sh
    install -Dm755 scripts/find_input_devices.sh "$pkgdir/usr/bin/bongocat-find-devices"
}
