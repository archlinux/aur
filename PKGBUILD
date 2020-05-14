# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark-git
_pkgname=${pkgname%-git}
pkgver=0.7.1.r2.g43f8856
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64' 'i686')
url="https://github.com/raphlinus/$_pkgname"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('cargo' 'git' 'rust')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags --match="v*" |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch
}

build() {
    cd "$_pkgname"
    cargo build --release --locked --all-features
}

package () {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/$_pkgname
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
