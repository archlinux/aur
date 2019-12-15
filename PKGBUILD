# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.4.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=('b06b42178ed9661950a7210016b603098b2b16fbf94cfb56cec09cd01521f7789a930782af94e51d38fb0538d871c68d07026e8607ea25fe31ed5e031449041e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/cloud-hypervisor" "${pkgdir}/usr/bin/cloud-hypervisor"
  install -Dm755 -t "${pkgdir}/usr/lib/cloud-hypervisor" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_blk" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_fs" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net"
}
