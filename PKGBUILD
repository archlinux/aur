# Maintainer: Saatvik <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=1.2.1
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
sha256sums=('f04d9e751ece6b8efa3f7d133241b890ea2df40197559bf81c57e74cd8e1ba5d')

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
