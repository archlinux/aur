# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=28.1
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
sha512sums=('198a6c0d1c08051c66cbf3f6877ba9bce371b2e20416110bcbc10c8ac2f02dc397f4477adb28f9c6eb2b83d617db5e8b58827f76f94056cbf98ccb465ee497e6')
b2sums=('428268485b712286617c10f3db4a84c38628b0750c75ad5956a289d8eb90bf921f6524a246f9675756672ce93f66f7580c00f2cc9d37ef07e76d127b2f391a15')
