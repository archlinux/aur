# Maintainer: Stephanie M. shteppi@dorcus.digital
# AUR Package for Fluxer TUI (git version)
pkgname=fluxer-tui-git
pkgver=0.6.9.r0.g0000000
pkgrel=1
pkgdesc="A terminal-based chat client for the Fluxer messaging platform (git version)"
arch=('x86_64')
url="https://github.com/dogbonewish/fluxer-tui"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('fluxer-tui')
conflicts=('fluxer-tui')
source=("fluxer-tui::git+https://github.com/dogbonewish/fluxer-tui.git")
sha256sums=('SKIP')

pkgver() {
    cd "fluxer-tui"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "fluxer-tui"
    cargo build --release --locked
}

package() {
    cd "fluxer-tui"
    install -Dm755 "target/release/fluxer-tui" "$pkgdir/usr/bin/fluxer-tui"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
