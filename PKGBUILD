# Maintainer: whymusticode <billGat48@proton.me>
pkgname=wlgrid-git
pkgver=1.0
pkgrel=1
pkgdesc="Wayland layer-shell grid launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/whymusticode/wlgrid"
license=('custom')
depends=('libxkbcommon' 'wayland' 'libglvnd')
makedepends=('rust' 'clang' 'mold')
provides=('wlgrid')
conflicts=('wlgrid')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags | sed 's/^v//'
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/wlgrid "$pkgdir/usr/bin/wlgrid"
    install -Dm644 config.toml.default "$pkgdir/usr/share/wlgrid/config.toml.default"
}
