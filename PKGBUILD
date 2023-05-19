# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=32.0
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

sha512sums=('5284a44b744331f0b4708017e53d99009273864716001b2d11886b5c33d402d972c21436171bebf64d1af29a6fb7a45680883fc71e90abe83dfce5a43bb02d89')
b2sums=('d4fa89370c6a3afa7d0308c7fb07cf8b6b3b01c2b295efbe77ccb8fedcc5793fb43bc02e1bc5f5da69d54040b5b2ed5fe2fb55214bbe9f19438daa0ca35e1f92')
