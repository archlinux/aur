# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=19.0
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
sha512sums=("59a0157d715e5ccb9ce21ad9313e60a48ccce79f5696417c075d57f65150f621aa354dacb0aebcb7eed83e44b830c871986d55cf7078ce3da6cc5def629f6f62")
b2sums=("8f4d861732962a22010416621a9743cfa1a3bac1a62957e653f659d3d3a5febd5f9a6c9ecec2aec009541340584711a62a167286f1ba7c5f24bfda2802b0c332")
b3sums=("9d6fc4877a86233a56ba18827a5ec9d7e1f39d0df2afaf4dba6aa4711023a5d6")

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
