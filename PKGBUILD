# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.6.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=('340cd200ac2e8221672d4c0904246881fcc280156931e8f12ac3fb9771dd525eec417c9e68fc81490a4f447f45a0193d3614f3aed4bb49980913ee46522cda21')

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
