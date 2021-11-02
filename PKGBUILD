# Maintainer: Maintainer: timescam <rex.ky.ng at gmail dot com>

pkgname="nsh-git"
_pkgname="nsh"
pkgver=0.4.2.581.g5760767
pkgrel=1
pkgdesc="A command-line shell like fish, but POSIX compatible"
arch=("i686" "x86_64")
url="https://github.com/nuta/nsh"
license=("CC0-1.0" "MIT")
depends=()
makedepends=("git" "rustup")
provides=("nsh")
conflicts=("nsh")
source=("$_pkgname::git+https://github.com/nuta/nsh.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	rustup install nightly
    cd $_pkgname
    cargo +nightly build --release --locked
}

check() {
    cd $_pkgname
    cargo +nightly test --release --locked
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/nsh "$pkgdir/usr/bin/nsh"
}
