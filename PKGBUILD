# Maintainer: Crstian <me@crstian.me>
pkgname=aceplay
pkgver=0.4.1
pkgrel=1
pkgdesc="Modern CLI to play Ace Stream links - auto-starts acestream-engine, supports mpv/vlc"
arch=('x86_64')
url="https://github.com/crstian19/aceplay"
license=('MIT')
depends=('acestream-engine')
optdepends=(
    'mpv: recommended video player'
    'vlc: alternative video player'
    'ffplay: alternative video player'
)
makedepends=('go')
conflicts=('aceplay-bin')
source=("https://github.com/crstian19/aceplay/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    go build -o aceplay -ldflags "-X main.version=$pkgver" ./cmd
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 aceplay "$pkgdir/usr/bin/aceplay"
    install -Dm644 aceplay.desktop "$pkgdir/usr/share/applications/aceplay.desktop"
}
