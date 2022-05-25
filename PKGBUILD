# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=24.0
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
sha512sums=('aa0185520c572ce781b73f9941e7c9016b7ee9d9219b052f24caec6a9ef221aa19730f7a0922ad594d84f6f4473d8013a09930d998241644aadec376a4d600ec')
b2sums=('4983f03fbb3e08b5ea36c719dbef9be0fd64022703dcf470fd432c3e07ace27d8d77e6104fb2cb6c95ad3b0eb41a36b31b098ba7201678fbfd23fdd071347d35')
b3sums=('576c5d2e949f12ab4de1be44125835ae3e5f58649202e924b117ebff65a73275')

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
