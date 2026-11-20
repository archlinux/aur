# Maintainer: Дамјан Георгиевски <gdamjan@gmail.com>
# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
# renovate: datasource=github-tags depName=cloud-hypervisor/cloud-hypervisor
pkgver=55.0
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

sha512sums=('0d958143318b6423aa7b7f0be8acf8196cdb2259c8039044484f8047dd9b8e7fa5904f5bfa117ab763b6edc3cc20b191ff067de3bbe84bbe9b606836515cebd0')
b2sums=('00307d6bc0ae9667f32bca03deb1c748e6b2cf6e13622edc9831d451eedce8609c5c4399815c09ae6515267806a5dcde7aa57c23f6c8399e5ae8af44ac601b5a')
