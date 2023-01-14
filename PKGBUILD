# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=29.0
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
sha512sums=('8be8f32dd7b049d760cd69f433c18751762fa174bc41d4946482ef016ec986a318493ebcb49c4ed7d65f8efaf092685eac772e9d1e982feca14d9eaf28d8bf43')
b2sums=('5821d24ae34ef9eb5cd9ae4c84d059069a194cf47275fd4eb29a3e9b816602b8ae5cc8ff989db1fd5a57e95467e3cd19c1af9528fd4c512f680210316d42f637')
