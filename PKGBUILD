pkgname=driftmusic-git
pkgver=r22.8a049b6
pkgrel=1
pkgdesc="Music streaming client for YouTube Music with Vim keybinds"
arch=('x86_64')
url="https://github.com/socatlolmeow/drift"
license=('GPL-3.0-or-later')
depends=('mpv' 'yt-dlp')
makedepends=('cargo' 'git')
options=('!lto')
provides=('driftmusic')
conflicts=('driftmusic')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd drift
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd drift
    cargo build --release --locked
}

package() {
    cd drift
    install -Dm755 target/release/drift "$pkgdir/usr/bin/drift"
}
