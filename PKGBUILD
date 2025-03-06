# Maintainer: Aethar <elliott.ashby88@gmail.com>

_pkgname=feather
pkgname="${_pkgname}-music-git"
pkgver=0.1.0.r0.bb4f6b3
pkgrel=2
pkgdesc="Feather is a lightweight, efficient, and locally hosted YouTube Music TUI built with Rust."
arch=('x86_64')
url="https://github.com/13unk0wn/Feather"
license=('MIT')
makedepends=('git' 'cargo>=1.85.0')
depends=('yt-dlp'
        'mpv')
provides=('feather')
source=("git+${url}.git")

build() {
    cd "${srcdir}" || exit
    cd Feather/feather_frontend || exit
    CFLAGS+=" -ffat-lto-objects"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "${srcdir}" || exit
    cd Feather || exit
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm755 feather_frontend/target/release/feather_frontend "$pkgdir/usr/bin/${_pkgname}"
}

sha256sums=('SKIP')
