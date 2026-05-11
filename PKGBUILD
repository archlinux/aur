# Maintainer: John Oberhauser <j.aur@obez.io>
pkgname=okshell
pkgver=0.10.0
pkgrel=1
pkgdesc="A customizable shell for Hyprland"
license=('GPL-3.0-only')
arch=('x86_64')
url="https://github.com/JohnOberhauser/OkShell"
depends=(
    'bluez'
    'gtk4'
    'gtk4-layer-shell'
    'hyprland'
    'hyprpicker'
    'libnotify'
    'libpipewire'
    'libpulse'
    'matugen'
    'networkmanager'
    'pam'
    'pipewire-alsa'
    'power-profiles-daemon'
    'upower'
    'wf-recorder'
)
makedepends=(
    'clang'
    'rust'
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e1185020343a84b88a72e4279f25b288fd9b0c96cfc88c6ddfb4e51192031a0c')

build() {
    cd "OkShell-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --workspace
}

package() {
    cd "OkShell-$pkgver"

    install -Dm755 target/release/okshell     "$pkgdir/usr/bin/okshell"
    install -Dm755 target/release/okshellctl  "$pkgdir/usr/bin/okshellctl"
    install -Dm755 target/release/okshellshare "$pkgdir/usr/bin/okshellshare"

    install -dm755 "$pkgdir/usr/share/icons"
    cp -r icons/OkMaterial  "$pkgdir/usr/share/icons/"
    cp -r icons/OkPhosphor  "$pkgdir/usr/share/icons/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
