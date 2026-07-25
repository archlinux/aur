# Maintainer: Wellzenon <https://github.com/wellzenon>
pkgname=cosmic-ext-niri-windows
pkgver=0.1.0
pkgrel=1
pkgdesc="Window list applet for COSMIC panel with Niri window manager integration"
arch=('x86_64')
url="https://github.com/wellzenon/cosmic-ext-niri-windows"
license=('GPL-3.0-or-later')
depends=('cosmic-panel' 'niri')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$SRCDEST/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$SRCDEST/cargo-home"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/cosmic-ext-niri-windows" "$pkgdir/usr/bin/cosmic-ext-niri-windows"
    install -Dm644 "data/io.github.wellzenon.CosmicExtNiriWindows.desktop" "$pkgdir/usr/share/applications/io.github.wellzenon.CosmicExtNiriWindows.desktop"
    install -Dm644 "data/io.github.wellzenon.CosmicExtNiriWindows.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.wellzenon.CosmicExtNiriWindows.metainfo.xml"
    install -Dm644 "data/io.github.wellzenon.CosmicExtNiriWindows.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.wellzenon.CosmicExtNiriWindows.svg"
}
