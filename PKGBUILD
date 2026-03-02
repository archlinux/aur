pkgname=dpibreak-git
pkgver=r357.f5c4f03
pkgrel=1
pkgdesc="DPI circumvention tool written in Rust"
arch=('x86_64')
url="https://github.com/Dilluti0n/DPIBreak"
license=('GPL-3.0-or-later')
depends=('nftables')
makedepends=('rust' 'cargo' 'git')
provides=('dpibreak')
conflicts=('dpibreak')
source=("$pkgname::git+https://github.com/Dilluti0n/DPIBreak.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/dpibreak "$pkgdir/usr/bin/dpibreak"
    install -Dm644 dpibreak.1 "$pkgdir/usr/share/man/man1/dpibreak.1"
}
