# Maintainer: Riccardo Marotti
#
# Generated from packaging/aur/PKGBUILD.in by scripts/generate-aur-package.sh:
# do not edit the generated PKGBUILD by hand.

pkgname=gitilante
pkgver=0.1.0
pkgrel=2
pkgdesc="A focused Git GUI for diffs, hunks and history"
arch=('x86_64')
url="https://gitlab.com/rutilante/gitilante"
license=('GPL-3.0-or-later')
depends=('git' 'gtk4' 'libadwaita')
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/rutilante/gitilante/-/archive/v$pkgver/gitilante-v$pkgver.tar.gz")
sha256sums=('47c3629b3ffbcb194e25dd98fdd773dce727130a1208c1a24a0cf60d3ef7bc82')

prepare() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    install -Dm755 target/release/gitilante \
        "$pkgdir/usr/bin/gitilante"
    # Short command name.
    ln -s gitilante "$pkgdir/usr/bin/gila"
    install -Dm644 data/dev.gitilante.Gitilante.desktop \
        "$pkgdir/usr/share/applications/dev.gitilante.Gitilante.desktop"
    install -Dm644 data/dev.gitilante.Gitilante.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.gitilante.Gitilante.svg"
    install -Dm644 data/dev.gitilante.Gitilante.metainfo.xml \
        "$pkgdir/usr/share/metainfo/dev.gitilante.Gitilante.metainfo.xml"
}
