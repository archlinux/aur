# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=rustanka-git
pkgver=v0.0.26.r4.g05885aa
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/grafana/rustanka"
license=('MIT')
depends=()
makedepends=('cargo' 'mimalloc')
source=("git+https://github.com/grafana/rustanka.git#branch=master")
sha512sums=('SKIP')

provides=(rustanka)
conflicts=(rustanka)

pkgver() {
    cd "$srcdir/rustanka"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/rustanka"

    cargo build --release --locked --package rtk
}

check() {
    cd "$srcdir/rustanka"

    cargo test --release --locked --package rtk
}

package() {
    cd "$srcdir/rustanka"

    install -Dm755 "target/release/rtk" "$pkgdir/usr/bin/rtk"
}
