# Maintainer : Alban <albdav.dev@gmail.com>
pkgname=toutui-bin
pkgver=0.4.2
pkgrel=3
pkgdesc="TUI Audiobookshelf client. Listen to your audiobooks and podcasts from your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/AlbanDAVID/Toutui"
license=('GPL3')
conflict=('toutui')
depends=('vlc' 'netcat')
provides=('toutui')
conflicts=('toutui' 'toutui-git')
source=(
    "${pkgver}-x86_64.tar.gz::https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui-x86_64-unknown-linux-gnu.tar.gz"
    "${pkgver}-aarch64.tar.gz::https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui-aarch64-unknown-linux-gnu.tar.gz"
    "config.example-${pkgver}.toml::https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/config.example.toml"
    "toutui-${pkgver}.desktop::https://github.com/AlbanDAVID/Toutui/releases/download/v${pkgver}-beta/toutui.desktop"
)
sha256sums=('21cff0370108981eee0a70660e31bed8960650eb7d85c3c10e4b7f044f1244f2'
            '633f91fefa04c1946076feb0e30b6195b08b379fb6a7379b8d23610d950af8c7'
            'e398fc5f9ff3f4a8841a9ae4675031a0f7e6e87b2762dab544ff23ae74eab0a9'
            'cd3281594f0d27f559732539f841c3fa44dba192ca7f0fa0d21a97f1f97ce6a0')
install=toutui.install
options=(!debug strip)

package() {
    cd "$srcdir"

    if [[ "$CARCH" == "x86_64" ]]; then
        tar -xvzf "${pkgver}-x86_64.tar.gz"
    elif [[ "$CARCH" == "aarch64" ]]; then
        tar -xvzf "${pkgver}-aarch64.tar.gz"
    fi

    install -Dm755 "toutui" "$pkgdir/usr/bin/toutui"
    install -Dm644 "config.example-${pkgver}.toml" "$pkgdir/usr/share/toutui/config.example.toml"
    install -Dm644 "toutui-${pkgver}.desktop" "$pkgdir/usr/share/applications/toutui.desktop"
}
