# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=38.0
pkgrel=1
pkgdesc="A Virtual Machine Monitor for modern Cloud workloads"
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

sha512sums=('63732f40b2faa699b3dd05629539ff4475031e822f97a5ea9049d983882dd6fc30b6c24f781053290ecc9262be2411681b09922e9e833a153ef29b7485d6509d')
b2sums=('9191da804c111b661beaa4b40bc0b492d4c2080844feec4fe29516aae4e93d8c23fb5d5e01fd53b7019f5a08190902933912823d6e915e939bc8cd230c024820')
