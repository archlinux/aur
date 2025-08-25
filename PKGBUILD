# Maintainer: Saatvik <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=1.2.5
pkgrel=1
pkgdesc="A Wayland overlay that displays an animated bongo cat reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/saatvik333/wayland-bongocat"
license=('MIT')
depends=('wayland' 'glibc')
makedepends=('gcc' 'make' 'wayland-protocols' 'wayland')
source=("wayland-bongocat-$pkgver.tar.gz::https://github.com/saatvik333/wayland-bongocat/archive/v$pkgver.tar.gz")
sha256sums=('ae9e2decf0143c6d345eb4d8a031e0345dd9c2bacaf14445afc1c0e19d380043')

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
