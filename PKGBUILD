# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=22.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
optdepends=(
  'virtiofsd: rust implementation of virtiofsd'
  'qemu-headless: for /usr/lib/qemu/virtiofsd'
)
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=('321a362346381b35006695b4cf300aa8f8171e5c4908873b1b073744964a82617861109835ddd1e48fb0ead9d3ae56f1e0f21c6187917b6f497987226b9ea3dc')
b2sums=('a6692ef2b9ea93b5666e896c93d11f6242ceaddfe284fd11a54a55b33d4307dc96c1097f0337914f9957130435981d33e4975e8d593057d19643b1f836677b79')
b3sums=('1e1657aa8669dba66bfeac213c586521b704911369d7cb925170a88a7963c274')

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
