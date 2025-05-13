# Maintainer: Alban <albdav.dev@gmail.com>
pkgname=toutui-git
pkgver=0.4.0.r0.g170062b
pkgrel=1
pkgdesc="TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlbanDAVID/Toutui"
license=('GPL3')
depends=('vlc' 'netcat')
makedepends=('git' 'rust' 'cargo' 'openssl' 'sqlite3')
provides=('toutui')
conflicts=('toutui' 'toutui-bin')
source=("git+https://github.com/AlbanDAVID/Toutui.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Toutui"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/Toutui"
    cargo build --release --locked
}

package() {
    cd "$srcdir/Toutui"

    install -Dm755 "target/release/toutui" "$pkgdir/usr/bin/toutui"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/toutui/config.example.toml"
    install -Dm644 "linux/toutui.desktop" "$pkgdir/usr/share/applications/toutui.desktop"
}
