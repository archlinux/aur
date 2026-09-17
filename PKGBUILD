# Maintainer: Xerusion <arch@xerusion.me>
pkgname="mossp"
pkgver="26.9.0"
pkgrel="1"
pkgdesc="open-source music player using iced and gstreamer"
arch=('x86_64')
url="https://mossp.org"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('cargo')
source=("https://codeberg.org/xerusion/mossp/archive/${pkgver}.tar.gz")
sha256sums=('a95dc31d63111dd8aa598f36549749ba1123622e517a48f9ba1035d32253c15c')
prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}
build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/share/applications/" "assets/linux/${pkgname}.desktop"
	install -Dm0755 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/" "assets/${pkgname}.png"
}
