# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin-miner-git
pkgver=r58.bffce19
pkgrel=1
pkgdesc='Standalone miner for grin'
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-miner'
license=('Apache')
depends=('ncurses')
makedepends=('cmake' 'git' 'rust')
source=('git+https://github.com/mimblewimble/grin-miner.git')
sha256sums=('SKIP')

pkgver() {
    cd grin-miner

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd grin-miner

    cargo build --release
}

package() {
    cd grin-miner

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin-miner
    install -Dm755 -t "${pkgdir}/usr/lib/grin-miner" target/release/plugins/*
}
