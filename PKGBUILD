# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=18.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
optdepends=(
  'qemu-headless'  # for /usr/lib/qemu/virtiofsd
)
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=("8acda894aec9399a0612fe4dc7291a702975b2e39d0e9c1b0b15efd91c3488ba01447ca13d2bb91bee33826517ca141b9f5cd2b78ee9ecfd43415480f90e4af7")
b2sums=("47f0ad286c9decf0e496d155f91ae9c44fa364a4ac93e9789e7f397e994e45aee102a5ee1100dcd33c24d3e41c86137d48c08902d103b4a53e7f0f27693a03f9")
b3sums=("7b0286affec04963cc09641138a505feff49efd08d28d5b2bd51597a957ca77c")

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
