# Maintainer: canfro <francodvo@gmail.com>
pkgname=erwin-intermediate-git
pkgver=r4.3c767f3
pkgrel=1
arch=('x86_64')
url="https://github.com/erwin-lang/erwin-intermediate.git"
license=('Apache-2.0')
makedepends=('git' 'rust' 'cargo')
pkgdesc="The Erwin intermediate language compiler"
depends=('gcc')
provides=('eil')
conflicts=('eil')
source=('git+https://github.com/erwin-lang/erwin-intermediate.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/erwin-intermediate"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/erwin-intermediate"
    cargo build --release --locked
}

package() {
    cd "$srcdir/erwin-intermediate"
    install -Dm755 "target/release/eil" "${pkgdir}/usr/bin/eil"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
