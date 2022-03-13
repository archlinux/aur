# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=22.1
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
sha512sums=('1320feee99c251d26076a628605cd906d2cf154eb033a0f607b6481f04057faf4799f809f6bcffedd5dd978aaae10776b9d1822a5157de7f96d5f695413668c3')
b2sums=('8a719be7846dc808f0de6c9de3ea540a7b5a1e3efaa4a1149fac0a63f97fc9495c5d4c6680d1f935cab68a6c2064330a59dc332b5c577c4e68a5969841e5f9a8')
b3sums=('4df077c4ec26184ccddd171a5156be8a1af36e6622e54f25ca7ba666f3a87c6e')

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
