# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-git
pkgver=2.1.3.r1525.gfcab5fb
pkgrel=1
pkgdesc='CLI tool and TUI for tracking token usage and costs from AI coding agents (development branch)'
arch=('x86_64')
url='https://github.com/junhoyeo/tokscale'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo' 'rust')
provides=('tokscale')
conflicts=('tokscale')
source=("$pkgname::git+https://github.com/junhoyeo/tokscale.git#branch=main")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.g%s" \
        "$(git describe --tags --abbrev=0 | sed 's/^v//')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
