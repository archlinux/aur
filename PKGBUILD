# Maintainer: Alban <albdav.dev@gmail.com>
pkgname=toutui-git
_pkgname=Toutui
pkgver=0
pkgrel=1
pkgdesc="TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlbanDAVID/Toutui"
license=('GPL3')
depends=('vlc' 'netcat')
makedepends=('git' 'rust' 'cargo')
provides=('toutui')
conflicts=('toutui' 'toutui-bin')
source=("git+https://github.com/AlbanDAVID/Toutui.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "target/release/toutui" "$pkgdir/usr/bin/toutui"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/toutui/config.example.toml"
    install -Dm644 "linux/toutui.desktop" "$pkgdir/usr/share/applications/toutui.desktop"
}
