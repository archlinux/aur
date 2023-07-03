# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=33.0
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

sha512sums=('9a6e87cfaecf6925ccc8b4ce9cfaf19fa2a3bf8424558b52035a7124e17033107810a9720007e515f7941abd895f8261537fe32097a12057edc20198d5113afe')
b2sums=('9c8d2f30fe92673d1433c1d4078d5575e8a29354565131de3e5f01ef0e663a434fd6d6e67aeb52d2db227120917b0fa9f5f04f87f021321ec76d08e3ee2a6d06')
