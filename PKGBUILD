# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=16.0
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
sha512sums=("5e779c8810a8e7094136345e2dae6d111624dcd9170b413969ad77722a6d0dd7256fe0d9e8ff90996ee6339f3a2660f5be3e957b7d6d9bba457ee3558c2a181d")
b2sums=("f8327de30c123bcab6ed8c67cc1498ff1e00217f94f001701a430f7365cc8dd28df1a164c55b05f692a5ac2abc58b96f43c3bec984cdd38cbdf319c18949d325")

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
