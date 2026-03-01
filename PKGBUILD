# Maintainer: annoyedmilk
pkgname=airpods-tui-git
pkgver=r6.00e82b7
pkgrel=1
pkgdesc="Terminal UI for managing AirPods on Linux over Bluetooth AACP"
arch=('x86_64')
url="https://github.com/annoyedmilk/airpods-tui"
license=('GPL-3.0-or-later')
depends=('bluez' 'dbus')
makedepends=('cargo' 'git')
optdepends=(
    'pipewire: audio routing'
    'wireplumber: volume control via wpctl'
    'swayosd: volume OSD overlay'
)
provides=('airpods-tui')
conflicts=('airpods-tui')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd airpods-tui
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd airpods-tui
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd airpods-tui
    install -Dm755 target/release/airpods-tui "$pkgdir/usr/bin/airpods-tui"
    install -Dm644 airpods-tui.service "$pkgdir/usr/lib/systemd/user/airpods-tui.service"
}
