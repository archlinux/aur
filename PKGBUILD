# Maintainer: John Oberhauser <j.aur@obez.io>
pkgname=okshell
pkgver=0.13.1
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
sha256sums=('2f6992d52607cc50cdff4d3d0b12fad0f9466195c827a16a009827f2e39b5ed6')

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
