# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=21.0
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
sha512sums=("a721a054913cb47af4b1ec4a222eb48aa153694e2d10a5d59f80a99232e4abc3e6c250762de5cefefbad931d42eb3bbcf7483821d4bd5c161d52d970e8f7fe00")
b2sums=("557260c8575979050cb7a84f5124fee998dc2d68147e7382d7d0a5123e475552764e70c1776a95d3d9a45c924b922e5d6bef2600247c81ec572b5545085536d0")
b3sums=("47e614d823edbc6470ec3ba7b7610c9da0db0a3caf1e1b33d9ade81357e1c1a7")

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
