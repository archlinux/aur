# Maintainer: Sebastian Kootz <skxxtz@gmail.com>
pkgname=sherlock-clp-git
_pkgname=sherlock-clp
pkgver=r5.234f9bb
pkgrel=1
pkgdesc="A custom plugin for Sherlock adding clipboard history support."
arch=('x86_64')
url="https://github.com/Skxxtz/sherlock-clipboard"
license=('GPL-3.0')
depends=()
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "sherlock-clipboard"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "sherlock-clipboard"
    cargo build --release
}

package() {
    cd "sherlock-clipboard"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    strip "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

