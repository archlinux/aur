# Maintainer: Radu Potop <radu at wooptoo com>

pkgname=git-repo-manager
pkgver=0.12.0
pkgrel=1
pkgdesc="GRM helps you manage git repositories in a declarative way"
arch=('x86_64')
url="https://github.com/hakoerber/git-repo-manager"
license=('GPL-3.0-only')
depends=('gcc-libs' 'rust')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b507ade718d1da0cc70116138f793d70d2ae8176e21fe3e7adfafd6d191a204')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/grm" "$pkgdir/usr/bin/grm"

    # documentation
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

    # licenses
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICEN[CS]E
}
