# Maintainer: Дамјан Георгиевски <gdamjan@gmail.com>
# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
# renovate: datasource=github-tags depName=cloud-hypervisor/cloud-hypervisor
pkgver=54.1
pkgrel=1
pkgdesc="A Virtual Machine Monitor for modern Cloud workloads"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=(
    glibc
    libgcc
)
optdepends=(
  'virtiofsd: rust implementation of virtiofsd'
)
makedepends=('rust')
options=('!lto' '!debug')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked --features fw_cfg
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/ch-remote" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/cloud-hypervisor"
  #install -Dm755 -t "${pkgdir}/usr/lib/cloud-hypervisor" \
  #  "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_blk" \
  #  "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net"
}

sha512sums=('fe24eab2ab00332d81e77dbf40e67d8c86a8819f5b649d525a1e2982475a1c294a07a6b6eb349eaf880d5402ef557399717a598281dc0216900feba1287aa138')
b2sums=('936464d13cd49a503f57cd0ac844469e6cc156eaa3f6fe7ca5765c8cb1a1ff67a1b0bf42188e7be2a929edca7e4bb3771b5ad97e773467261e58df30b3f3e15d')
