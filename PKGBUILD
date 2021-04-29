# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=15.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
optdepends=(
  'qemu-headless'  # for /usr/lib/qemu/virtiofsd
)
makedepends=('rust')
source=("https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v${pkgver}.tar.gz")
sha512sums=("0f39afaa9e194f9a1e0d94d7baf98af272be0ab9fc2abdc40bd03098f94439be5e19b558bdf64fd18cde185cfbc4ada60f32ac184f52aa34269976d9d11c2b39")
b2sums=("4c4c5615cb343792a5f71a76180cc97deebf4637c56c73af27be8cbf32f68cc8f0abad4035f3e1fc2eeee6ced572634e3e98c6ad0237dea794b98cde1e2fe527")

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
