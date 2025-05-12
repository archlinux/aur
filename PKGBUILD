# Maintainer : Alban <albdav.dev@gmail.com>
pkgname=toutui
pkgver=0.4.0
pkgrel=1
pkgdesc="TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/AlbanDAVID/Toutui"
license=('GPL3')
depends=('vlc' 'netcat')
source=("https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui-x86_64-unknown-linux-gnu.tar.gz" 
        "https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui-aarch64-unknown-linux-gnu.tar.gz"
        "https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/config.example.toml"
        "https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui.desktop"
       )
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
install=toutui.install
options=(!debug strip)

package() {
    cd "$srcdir"

    if [[ "$CARCH" == "x86_64" ]]; then
        tar -xvzf "$srcdir/$(basename "${source[0]}")"
    elif [[ "$CARCH" == "aarch64" ]]; then
        tar -xvzf "$srcdir/$(basename "${source[1]}")"
    fi

    install -Dm755 "toutui" "$pkgdir/usr/bin/toutui"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/toutui/config.example.toml"
    install -Dm644 "toutui.desktop" "$pkgdir/usr/share/applications/toutui.desktop"
}
