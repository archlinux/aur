# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.12.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
optdepends=(
  'qemu-headless'  # for /usr/lib/qemu/virtiofsd
)
makedepends=('rust')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  ac11e1d8398497a18c8996b80b7b2f3f7f114ed1eb9b3f3ce09b1f600a6267391701001c638f0b5570acdcb5a0b2f9ea8500f3d1a1ac0e341a7537f11cbb8b4a
)
b2sums=(
  75b63c088178b91c53b41a26e823bafb00b863840c39b2095f0e7f683d4e8dfa3d77c027d48c80fbb4a772966b12979c5d1df98c44f23cc1e2a99d189fcd488d
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
