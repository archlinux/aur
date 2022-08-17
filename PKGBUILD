# Maintainer: taotieren  <admin@taotieren.com>

pkgname=aliyundrive-fuse
pkgver=0.1.13
pkgrel=1
pkgdesc="阿里云盘 FUSE 磁盘挂载"
arch=("any")
url="https://github.com/messense/aliyundrive-fuse"
license=("MIT")
depends=("fuse3")
makedepends=('rust')
provides=("${pkgname}")
# options=("!strip" "emptydirs")
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c6b349364868fe76258b0f368219ba22659f8837747504d65babaf258a7cf5b')

# prepare() {
#     cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
# }

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build  --release --all-features
}

# check() {
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test  --all-features
# }

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track  --all-features --root "$pkgdir/usr/" --path .
    install -Dm644 "systemd.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}
