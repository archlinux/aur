# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.3.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('qemu-virtiofs-headless')
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=('e026148e69b1990478641e16e96577f2bc273e467a831b3f4442c17b58e4574f11fcf05dc197d274575701c8ccc87fba19e14b49f804b5eb91bc5154beb16ef1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/cloud-hypervisor" "${pkgdir}/usr/bin/cloud-hypervisor"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net" "${pkgdir}/usr/lib/cloud-hypervisor/vhost_user_net"
  #install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net" "${pkgdir}/usr/bin/vhost_user_net"
}
