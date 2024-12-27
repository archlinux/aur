# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname='aw-watcher-media-player'
pkgver=1.1.1
pkgrel=1
pkgdesc="Watcher of system's currently playing media for ActivityWatch"
arch=(x86_64)
url="https://github.com/2e3s/$pkgname"
license=(Unlicense)
depends=(activitywatch dbus openssl)
makedepends=(git cargo)
conflicts=("$pkgname")

source=("git+$url#tag=v$pkgver")
sha512sums=('6091cb80435aca17b1fa05582afe877a3d49480a8d195f866a33c6d64167777db8c503483fcc27aa15e5e649101ae480b02c42f170c6b6189aca27dd392e56ce')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/aw-watcher-media-player" -t "$pkgdir/usr/bin/"
    install -Dm644 "visualization/index.html" -t "$pkgdir/usr/share/$pkgname/visualization/"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
