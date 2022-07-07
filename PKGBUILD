# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=25.0
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
sha512sums=('4b419a4dc72cb402cd71793cce33ac92509d24bcd7cd72ec03c2415a709b6eb2a0476a7a140a7846954650491bb31e364108f49e14a86c002ec5de5d402d37d4')
b2sums=('b1e3c7d55fe149a049773532b655da645c02587fa41ce2fdc0f1adcdd06506785563b0a03cdb71ed25e9913431636d10b772424036788fcfbf523c1e95248673')
b3sums=('eaaae5abc4758bf5805cef31134497ec63c86397b616d5d2dc70cc41ad4bdc0d')

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
