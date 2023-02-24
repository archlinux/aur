# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=30.0
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
sha512sums=('a6e73ca995d282e1830c410c09b51ddb069decd64f1f868816fe8035fa0f08a4aabedfde52099686a160b13b2e21625a65049c43a9d4024fc0ff8952a7f00c04')
b2sums=('3b9f4ba5f32a1cf72b653ba971ff062bff457df13224a78222c3fbeef65c55ce94e0c90a3b674411e75b7a092714146c72807a5f2a2dc42c52cec72eea3475e7')
