# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=31.0
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
sha512sums=('9ddb8bce534331f609d00703e1c47e4359723432661aef4e0b920f8b289f13c9fda68d0f3320bcbc80824f699df1e456375b6268355c8a79d69c78e5d7659f52')
b2sums=('b88f1cb53fde6085c33e969d508fbccf29d54e2f04cee143340d0a43547a967d7cdea6bc880c24c84e34bfc4a4d8c4e4478aeb54e858d4518e528f07b521b9b3')
