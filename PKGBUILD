# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=20.2
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
sha512sums=("eba58f505edaa748c9884e7479b35030a611cd36b4b2bbd3b18e5c579fb7cb28815c6301f1b60c68dcf62d4c496d28d7e8b3bf13369833bc491a8b8360724eb8")
b2sums=("1e8d03d6913cbd186cbfd62c4151b3be453c1e4b1fa8c06232722c692c35bcfc7167d6a1318459d6742b5865b2d58d097ae373dc798ecfd7a15b171a72fcb0a3")
b3sums=("4de94d7a78926935ca9c7cb9a0827afbb8eb203139cf6e5dc32f0ec2f1a99039")

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
