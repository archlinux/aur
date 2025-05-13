# Maintainer: Alban <albdav.dev@gmail.com>
pkgname=toutui-git
_pkgname=Toutui
pkgver=0
pkgrel=1
pkgdesc="TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlbanDAVID/Toutui"
license=('GPL3')
depends=('vlc' 'gnu-netcat')
makedepends=('git' 'rust' 'cargo')
provides=('toutui')
conflicts=('toutui' 'toutui-bin')
source=("git+https://github.com/AlbanDAVID/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/-/./g;s/.beta//'
}

build() {
    cd "$_pkgname"
    cargo build --release --locked
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/toutui" "$pkgdir/usr/bin/toutui"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/toutui/config.example.toml"
    install -Dm644 "linux/toutui.desktop" "$pkgdir/usr/share/applications/toutui.desktop"
}
