# Maintainer: coldbrxthe <rocattjust@gmail.com>
pkgname=rs-pug-git
pkgver=r.1
pkgrel=1
pkgdesc="Terminal YouTube music player with mpv, yt-dlp and Lua plugin support"
arch=('x86_64')
url="https://github.com/coldbrxthe/rs-pug"
license=('MIT')
depends=('mpv' 'yt-dlp')
optdepends=('mpv-mpris: MPRIS/playerctl support')
makedepends=('rust' 'cargo' 'git')
provides=('rs-pug')
conflicts=('rs-pug')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/rs-pug" "$pkgdir/usr/bin/rs-pug"
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
