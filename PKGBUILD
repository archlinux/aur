# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
_pkgname=rustfmt
pkgname=$_pkgname-git
pkgver=r753.ecf1277
pkgrel=1
pkgdesc=""
arch=('x86' 'x86_64')
url="https://github.com/nrc/rustfmt"
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -D "target/release/rustfmt" "$pkgdir/usr/bin/rustfmt"
    install -D "target/release/cargo-fmt" "$pkgdir/usr/bin/cargo-fmt"
}
