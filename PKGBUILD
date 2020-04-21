# Maintainer: Petr Šťastný <aur@soptik.tech>
pkgname=desed-git
pkgver=1.0.r15.g0417cbc
pkgrel=1
pkgdesc="Debugger for sed, written in rust. Step through code and observe sed inner state."
arch=('x86_64')
url="https://github.com/soptikha2/desed"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('desed')
source=("$pkgname::git+https://github.com/soptikha2/desed.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"

    cargo build --release
}

package() {
    cd "$pkgname"

    install -D "target/release/desed" -t "$pkgdir/usr/bin"
}
