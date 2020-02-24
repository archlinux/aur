# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.5.1
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=('a9e36b3259eea7b1cdde4184c73036ebe6f8dfa0a5e9e35775c60ad94878cc203ec759591f95f09ffbb04ad68e8331ab212921502677ac7d9c538d826ec8fc5b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/cloud-hypervisor" "${pkgdir}/usr/bin/cloud-hypervisor"
  install -Dm755 -t "${pkgdir}/usr/lib/cloud-hypervisor" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_blk" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_fs" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net"
}
