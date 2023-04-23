# Maintainer: Jasper <j@sperp.dev> -> https://github.com/jaspwr

pkgname=volapplet-git
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple GTK system tray volume controller applet."
depends=('gtk3' 'pulseaudio')
makedepends=('rust' 'cargo' 'git')
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jaspwr/vol-applet"

source=("$pkgname::git+https://github.com/jaspwr/vol-applet#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/volapplet"
}
