# Maintainer: Stokes <jesusmanuelgonzalezmeneses18@gmail.com>

pkgname=educamadrid-wifi
pkgver=0.2.1
pkgrel=1
pkgdesc="Unofficial GUI to connect to the EducaMadrid WEDU_PROF Wi-Fi network via NetworkManager"
arch=('x86_64')
url="https://github.com/13Stokes31/educamadrid_wifi"
license=('MIT')
depends=('networkmanager' 'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4244a85e1d02ca77d5c83ed7a2d18bd12d9e0635b3c813553b6eea465d28ae5d')

prepare() {
    cd "educamadrid_wifi-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "educamadrid_wifi-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "educamadrid_wifi-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "educamadrid_wifi-$pkgver"
    install -Dm755 target/release/educamadrid-wifi -t "$pkgdir/usr/bin/"
    install -Dm644 educamadrid-wifi.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
