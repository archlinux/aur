# Maintainer: Namkhai B. <echo em.roekn@kn | rev>

pkgname=rres
pkgver=0.1.5
pkgrel=1
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://sr.ht/~nkeor/rres"
license=('GPLv3')
makedepends=('rust')
source=("https://git.sr.ht/~nkeor/rres/archive/v${pkgver}.tar.gz")
sha256sums=('d52d7cf582ebc0827073bdef53937aa3eceea95416019dfa8f076620ae992a61')

prepare() {
    cd ${pkgname}-v${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-v${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd ${pkgname}-v${pkgver}
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
