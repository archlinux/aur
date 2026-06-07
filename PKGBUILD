# Maintainer: Squirrel Modeller <https://github.com/SquirrelModeller>
pkgname=athroisma-git
pkgver=r12.2e6ae3c
pkgrel=1
pkgdesc="Lightweight Linux system stats process emitting one JSON line per interval to stdout"
arch=('x86_64')
url="https://github.com/SquirrelModeller/athroisma"
license=('MIT')
makedepends=('cargo' 'git')
provides=('athroisma')
conflicts=('athroisma')
source=("$pkgname::git+https://github.com/SquirrelModeller/athroisma.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$pkgname"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/athroisma" \
        "$pkgdir/usr/bin/athroisma"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
