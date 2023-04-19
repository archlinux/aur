# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=31.1
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
sha512sums=('15162ed6fccf2c29a4562d7fdcda9f905017f4e0a64841992f7436a4841b3c79946044308ebc2b0216e63d7dfd889d7fdc30dc30a831dddfd28846ab8618428f')
b2sums=('cf79865e27c742626a70fd498f13077d939b8207a28f6cfc161ebc22c5e102007d0c5aee9dd9edfcd11d2256abd8b7b40399493d09ec2adc94121536e035fa4f')
