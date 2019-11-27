# Maintainer: Baz <github(a)luxolus.com>

pkgname=jaesve-git
_pkgname=jaesve
pkgver=1.3.3
pkgrel=2
pkgdesc="A CLI utility for stream converting JSON objects to a series of CSV values"
url="https://github.com/bazaah/jaesve"
license=("MIT")
source=("git+https://github.com/bazaah/jaesve")
md5sums=('SKIP')
arch=('x86_64')
makedepends=('rustup')

prepare () {
    cd "$_pkgname"
    git checkout --quiet $pkgver
    rustup override set 1.39.0
}

build() {
    cd "$_pkgname"
    cargo build --release --locked
}

check() {
   cd "$_pkgname"
   cargo test --release --locked
}

package() {
   cd "$_pkgname"
   install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}

