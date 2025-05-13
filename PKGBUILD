# Maintainer: Alban <albdav.dev@gmail.com>
pkgname=toutui-git
_pkgname=Toutui
pkgver=0.4.0.beta.0.g5c41f78
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
	cd "$srcdir/$pkgname" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/toutui" "$pkgdir/usr/bin/toutui"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/toutui/config.example.toml"
    install -Dm644 "linux/toutui.desktop" "$pkgdir/usr/share/applications/toutui.desktop"
}
