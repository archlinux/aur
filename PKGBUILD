# Maintainer: Nik <acidnik@users.noreply.github.com>

pkgname=mriya-wm
pkgver=0.1.0
pkgrel=1
pkgdesc="Stacking Wayland window manager with xfwm4 window decorations"
arch=('x86_64')
url="https://github.com/acidnik/mriya-wm"
license=('MIT')
depends=('libxkbcommon' 'mesa' 'wayland' 'fontconfig' 'freetype2')
optdepends=('xcursor-themes: cursor themes for the compositor to load')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url.git#commit=b30a00f8f4835763e7b3b41d00164cd08990de28")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname"
    ./target/release/mriya-wm --help >/dev/null
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 target/release/mriya-wm "$pkgdir/usr/bin/mriya-wm"
    install -Dm755 dist/mriya-session "$pkgdir/usr/bin/mriya-session"
    install -Dm644 dist/mriya.desktop \
        "$pkgdir/usr/share/wayland-sessions/mriya.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
