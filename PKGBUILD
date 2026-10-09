# Maintainer: Дамјан Георгиевски <gdamjan@gmail.com>
# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=51.2 # renovate: datasource=github-tags depName=cloud-hypervisor/cloud-hypervisor
pkgrel=1
pkgdesc="A Virtual Machine Monitor for modern Cloud workloads"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=(
    gcc-libs
    glibc
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
  #  "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_fs" \
  #  "${srcdir}/${pkgname}-${pkgver}/target/release/vhost_user_net"
}

sha512sums=('5a4dbd2b7fd04755b4161ed0e28c77eb41d3d10eb36c1f15cbb365ca79a65a353534ee797e12486b4ea203add56daa1c2910a6af690747e80821368ca4b28769')
b2sums=('73d6d8f451c9c3d9a68bf91f1e047e61c11ddb10f61c17994eb4e1eafc96303f91ffb50c80d8b8efd6506d1b3efeb93cd1a44d090f50e03d0c253851f2b39473')
