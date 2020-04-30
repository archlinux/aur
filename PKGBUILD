# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.7.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=('eaaeba2416ca51ff4a2d71ceff8b435ec443dd147bc59e0d347f8b9e5be8560b4fde67c099c28a4edfed0346c85f136cba38317fa2ae79aac1d2406725d58ef0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/ch-remote" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/cloud-hypervisor"
  install -Dm755 -t "${pkgdir}/usr/lib/cloud-hypervisor" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_blk" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_fs" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net"
}
