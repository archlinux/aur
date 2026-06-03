# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr
pkgver=0.8.2
pkgrel=1
pkgdesc="A Wayland screenshot tool written in Rust"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d3c2f40f48c262c71879ed7c728c646e47ec16cd54a473010fe7d3e14960615')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/framr" "$pkgdir/usr/bin/framr"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
