# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=wlprobe
pkgver=0.1.0
pkgrel=1
pkgdesc="wayland-info but intended for computers rather than humans"
arch=("x86_64")
url="https://github.com/PolyMeilex/wlprobe"
license=("MIT")
makedepends=("rust")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PolyMeilex/wlprobe/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("c537ffdcfafd8fb6c9e1fdd387158762cb58f980bedbfca72b65489f344d51b3")

prepare() {
    cd "wlprobe-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "wlprobe-${pkgver}"
    cargo build --frozen --release --package wlprobe
}

package() {
    cd "wlprobe-${pkgver}"
    install -Dm755 "target/release/wlprobe" "${pkgdir}/usr/bin/wlprobe"
}
