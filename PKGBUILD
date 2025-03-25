# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=wol-rs
pkgver=0.2.1
pkgrel=1
pkgdesc='Wake up remote hosts with Wake On LAN magic packets'
arch=('i686' 'x86_64')
url="https://github.com/swsnr/wol.rs"
license=('MPL-2.0')
depends=()
conflicts=('wol')
makedepends=('rust' 'cargo')
options=()
source=(
    "${url}/releases/download/v${pkgver}/wol-v${pkgver}.tar.zst"
    "wol-vendor-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/vendor.tar.zst"
    "config.toml"
)
sha256sums=('6a4a7a9ae92fd566c2cdf4aab57555fdc748b3f0337e74b3d7af7cae7d14f604'
            'b0a933f09266d3314e8d8e3722e0335b79f89ef6069b3b30fea145bba9f4747e'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881')

prepare() {
    cd "wol-v${pkgver}" || return 1
    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "wol-v${pkgver}" || return 1
    cargo build --release --locked --features cli
}

package() {
    cd "wol-v${pkgver}" || return 1
    install -Dm755 "target/release/wol" "${pkgdir}/usr/bin/wol"
}
