# Maintainer: Ruan <ruanvasconcelos898@gmail.com>
pkgname=easy-remote
pkgver=0.1.0
pkgrel=1
pkgdesc="Open-source 'Single Click' remote support client for Linux."
arch=('x86_64')
url="https://github.com/RuanVasco/easy-remote"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2' 'x11vnc' 'wayvnc')
makedepends=('cargo' 'git')
source=("git+https://github.com/RuanVasco/easy-remote.git#branch=main")
md5sums=('SKIP')
backup=('etc/easy-remote/entries.xml') 

options=('!lto')

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    cargo build --release --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/easy-remote" "$pkgdir/usr/bin/easy-remote"
    install -Dm644 "assets/com.github.RuanVasco.easy-remote.desktop" \
        "$pkgdir/usr/share/applications/com.github.RuanVasco.easy-remote.desktop"
    install -Dm644 "assets/com.github.RuanVasco.easy-remote.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.RuanVasco.easy-remote.svg"
    install -Dm644 "assets/entries.xml" "$pkgdir/etc/easy-remote/entries.xml"
}