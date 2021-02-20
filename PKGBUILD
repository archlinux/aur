# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=0.14.0
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
sha512sums=("972840c1d7ddf256e0202e639421ec9f7d20cc598cadce859980ce96e30a242fee1d90fd5e8cbe7ded9b8e4ecc6034f9aa2f36b891bab5b64ad32f4516c24fe6")
b2sums=("1d40a5d239244934e1fa622113cf187af9bcfafe35a337a8aa41c4b260e5137ab8e3bf1621789cd53e209107cebf8d4f50fd62cccec9d81cb26aad85905ef342")

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
