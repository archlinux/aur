# Maintainer: kingdomkind <kingdomkind@protonmail.com>

_pkgname='depac'
pkgname="$_pkgname-git"
pkgrel=1
pkgver=r6.15f37c9
pkgdesc='A declarative pacman wrapper, with aur/source support'
arch=('x86_64')
url='https://github.com/Mayware/depac'
makedepends=('cargo' 'git')
depends=('pacman' 'openssl')
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
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
