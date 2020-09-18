# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.10.0
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
  dbc5a99205d9fe678ba614aee40642c6d3f1dbc52c2ed8c29134aa69510e0b3c32a6b102c3dd286f16ac1d27604796acdfe49c3d67d8647c385d7d7bbabbba98
)
b2sums=(
  d36b0e33c53ea7ec6e490cb1ce59d5d42456b60fdb16896bb365ec5cde626d1e8ae20924d1e1a6b89d1cc8628119b0ee3505e93ac0ee15d582f4bbdea36037a3
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
