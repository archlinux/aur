# Maintainer: Mylloon <kennel.anri@tutanota.com>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='cal8tor'
pkgver=0.4.2
pkgrel=1
pkgdesc='Timetable extractor for the computer science degree of Paris 8'
arch=('x86_64')
url=https://git.mylloon.fr/Anri/cal8tor
makedepends=('git' 'cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://git.mylloon.fr/Anri/$pkgname/archive/$pkgver.tar.gz")
md5sums=('9864505e186f3105630b0a1e1e61f51f')

prepare() {
    cd "$pkgname" || exit
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname" || exit
    cargo build --frozen --release --all-features
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
