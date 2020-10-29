# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.11.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
depends=(
  'qemu'  # for /usr/lib/qemu/virtiofsd
)
makedepends=('rust')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  de55ca83f2c6e11d8b6a3762c157726315167eca2a923a46a344bd2abb7b5c3f8ce8f0994609852194cc5b1db8fa8fe207affa5dea0a1a57b431bed77c6efab4
)
b2sums=(
  34143182d334576969ba1d166cc51091a0a2b59f7c9cc0c1403a2e07118a3267a2b806f83871bc271cbf463bbe245ffb094a76fdb2b00595acd4d01736a84142
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
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
