# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=20.1
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
sha512sums=("229d081b9bacc048287e84d268c48443f456b9eadd14e812d818900d67e88f12f60eaa2503ffecd0017a5db147063f63165b6d702413fb7ebeeaaf2acd08113c")
b2sums=("0e44ff622e84443aadba36479ee6f7394b88649c927a9671598d39953906dd464a0d5b71d29e3086c6cace5bc8f97a07f39795cacb5bba851805ab475692db1f")
b3sums=("4d09f89885d5b7d58d6d30fdb429172669958a03f5018ec4bdbbcef5ea688fdf")

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
