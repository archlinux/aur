# Maintainer: kingdomkind <kingdomkind@protonmail.com>

_pkgname='desym'
pkgname="$_pkgname-git"
pkgrel=1
pkgver=r15.c5e02a0
pkgdesc='a declarative symlink & file manager'
arch=('x86_64')
url='https://github.com/Mayware/desym'
makedepends=('cargo' 'git')
depends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('LGPL-3.0-or-later')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
