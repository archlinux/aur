# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.14.1
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
optdepends=(
  'qemu-headless'  # for /usr/lib/qemu/virtiofsd
)
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=("df701116d880888cbcdfc3c3cf916c9dd7e15ecc8eb289fec9f5ccbe6a9310ff30c8341745178187c4d6d7150ac511766784459a589ba1ffb193155bf849f856")
b2sums=("4d025bab063d7e6f0d158312eb960c64049c2f6adbc332d49457215b2ae77f5719b846b0e50a74986f3fdde1a24635daed9f4502c35026d1a7e4a47f88ee1be3")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/ch-remote" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/cloud-hypervisor"
  #install -Dm755 -t "${pkgdir}/usr/lib/cloud-hypervisor" \
  #  "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_blk" \
  #  "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_fs" \
  #  "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net"
}
