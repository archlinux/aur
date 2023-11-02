# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=36.0
pkgrel=1
pkgdesc="A Virtual Machine Monitor for modern Cloud workloads"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
optdepends=(
  'virtiofsd: rust implementation of virtiofsd'
  'qemu-headless: for /usr/lib/qemu/virtiofsd'
)
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")

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

sha512sums=('d3743dba9a7d1444cd79de781b951d756577bea9de06bac8c737a1ca132598ecbce2d830aafefdf798dc77c076acbcac36715b26cbe8f754d23e2edc78dff8ce')
b2sums=('a607411895ad49542a17d89ee36bf79e993d2764b1aa3cd8a1b25fc9a1d5d6d1a59a808ce47cbf6ff0f331c0c7f9aa3efdf5d39c7701f8a11ce0ed5dca8081aa')
