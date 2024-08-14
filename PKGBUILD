# Maintainer: Deniz Demir <darkenedMellow@protonmail.com>

pkgname=hardcpy-git
pkgver=r23.3637a3e
pkgrel=1
pkgdesc="Simple backup tool written in Rust"
url="https://github.com/obvMellow/hardcpy"
license=(GPL-3.0-or-later)
makedepends=('rust' 'cargo' 'git')
depends=('sqlite3')
conflicts=('hardcpy-bin')
source=("git+https://github.com/obvMellow/hardcpy.git")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
sha256sums=('SKIP')

pkgver() {
    cd hardcpy
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/hardcpy"
    cargo build --release
}

package() {
    cd "$srcdir/hardcpy"
    install -Dm755 target/release/hardcpy "$pkgdir/usr/bin/hardcpy"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
