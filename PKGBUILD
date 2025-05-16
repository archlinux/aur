# Maintainer: Alban <albdav.dev@gmail.com>
pkgname=toutui-git
_pkgname=Toutui
pkgver=1
pkgrel=1
pkgdesc="TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlbanDAVID/Toutui"
license=('GPL3')
depends=('vlc' 'gnu-netcat')
makedepends=('git' 'rust')
provides=('toutui')
conflicts=('toutui' 'toutui-bin')
source=("git+https://github.com/AlbanDAVID/${_pkgname}.git")
sha256sums=('SKIP')
options=(!debug !lto)

pkgver() {
    cd "$_pkgname"
    git describe --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/toutui" "$pkgdir/usr/bin/toutui"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/toutui/config.example.toml"
    install -Dm644 "linux/toutui.desktop" "$pkgdir/usr/share/applications/toutui.desktop"
}
