# Maintainer : Alban <albdav.dev@gmail.com>
pkgname=toutui-bin
pkgver=0.4.1
pkgrel=2
pkgdesc="TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/AlbanDAVID/Toutui"
license=('GPL3')
conflict=('toutui')
depends=('vlc' 'netcat')
provides=('toutui')
conflicts=('toutui' 'toutui-git')
source=("https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui-x86_64-unknown-linux-gnu.tar.gz" 
        "https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui-aarch64-unknown-linux-gnu.tar.gz"
        "https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/config.example.toml"
        "https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui.desktop"
       )
sha256sums=('59d5a7dec8b6ef84aab13cc9c7fa25f7675b102322c7680bea4709ee5b7d84f0'
            '34a2316a94e4dea7fd08d73a18c2683d2b5bbdf6a7683b183dc6ea212846fb92'
             'e398fc5f9ff3f4a8841a9ae4675031a0f7e6e87b2762dab544ff23ae74eab0a9'
             'cd3281594f0d27f559732539f841c3fa44dba192ca7f0fa0d21a97f1f97ce6a0')
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
