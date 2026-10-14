# Maintainer: Дамјан Георгиевски <gdamjan@gmail.com>
# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
# renovate: datasource=github-tags depName=cloud-hypervisor/cloud-hypervisor
pkgver=54.0
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

sha512sums=('d13b26b9b076bf4060a186d33205262bf462cfd1c49b00e0b8f4b1a6c33d09cab54070e397b71aa704dd27e2efa63d0e5c88aa0f58c6d4e06394b6afaf428e88')
b2sums=('977c6686dad1909fc52b342b30bcabe8d7d015f09a298ed4b008cde5cb7b18c62cedc00be7497aa74f52e62dd0142c16a5d0479913c10986fb99568fabd5afab')
