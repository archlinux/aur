# Maintainer: Aspenini <aspeninifeltner@gmail.com>

pkgname=evidence-manager
pkgver=1.2.0
pkgrel=1
pkgdesc='Cross-platform GUI application for managing and organizing evidence'
arch=('x86_64')
url='https://github.com/Aspenini/Evidence-Manager'
license=('MIT')

depends=(
    'glibc'
    'gcc-libs'
    'gtk3'
    'libx11'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'
)

makedepends=(
    'cargo'
    'git'
)

source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
    cd "$pkgname"

    cargo fetch --locked
}

build() {
    cd "$pkgname"

    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"

    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname"

    install -Dm755 \
        target/release/evidence-manager \
        "$pkgdir/usr/bin/evidence-manager"

    install -Dm644 \
        packaging/evidence-manager.desktop \
        "$pkgdir/usr/share/applications/evidence-manager.desktop"

    install -Dm644 \
        icons/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/evidence-manager.png"

    install -Dm644 \
        LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 \
        README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
