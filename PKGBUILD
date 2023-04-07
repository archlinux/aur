# Maintainer: poly000 <pedajilao@163.com>
pkgname=core-to-core-latency
pkgver=1.0.0
pkgrel=1
pkgdesc="Measure cross-CPU message send latency"
url="https://github.com/nviennot/$pkgname"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

source=("https://github.com/nviennot/core-to-core-latency/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b6bdd1b6e403228d7c232174a21fd4e0b2be5bc707d9490f04ac6baf1321aaee')

license=('MIT')
makedepends=('cargo')

build() {
    cd "$srcdir/$pkgname-${pkgver}"

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
