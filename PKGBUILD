# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.8.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=('836aa692028c5b84b122e6586b6da7a3d5cb526914cee541d857a07e83806fe3fabecfa4ebf9f8128ad6c2fb9d0a6ac287ce1bd5137c5a4cf8f5e98771eb8af2')

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
