# Maintainer: reakjra <reakjra@proton.me>
pkgname=raw-cli-git
pkgver=r4.2702a2d
pkgrel=1
pkgdesc="Watch anime from the terminal - TUI built with ratatui"
arch=('x86_64')
url="https://github.com/reakjra/raw-cli"
license=('MIT')
depends=('mpv')
makedepends=('git' 'rust')
optdepends=('vlc: alternative video player'
            'syncplay: watch with friends'
            'yt-dlp: required for some providers')
provides=('raw-cli')
conflicts=('raw-cli')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/raw-cli"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/raw-cli"
    cargo build --release
}

package() {
    cd "${srcdir}/raw-cli"
    install -Dm755 "target/release/raw-cli" "$pkgdir/usr/bin/raw-cli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/raw-cli/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/raw-cli/README.md"
}
