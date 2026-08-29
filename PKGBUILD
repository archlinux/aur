# Maintainer: Vasiliy Stelmachenok <ventureo@cachyos.org>
pkgname=flatpak-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI wrapper for Flatpak written in Rust"
arch=('x86_64')
url="https://github.com/ArisoN-ext/flatpak-helper"
license=('GPL-3.0-or-later')
makedepends=('git' 'rust' 'cargo')
depends=('flatpak' 'glibc' 'libgcc')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('1017bdcfd93e463af3afe5e679052e92937afd2bff4fdfa1004e6c95c56c49c5')

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname"
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
