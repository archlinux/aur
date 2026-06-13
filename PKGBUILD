# Maintainer: whymusticode <billGat48@proton.me>
pkgname=wlgrid-git
pkgver=r73.59b404e
pkgrel=1
pkgdesc="Wayland layer-shell grid launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/whymusticode/wlgrid"
license=('custom')
depends=('libxkbcommon' 'wayland' 'libglvnd')
makedepends=('rust' 'clang' 'mold')
provides=('wlgrid')
conflicts=('wlgrid')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
