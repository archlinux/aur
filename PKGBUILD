# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor
pkgver=20.0
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
sha512sums=("08be1987724174957fe2ec4d86c3fc6edc36cd999490a415cf4ad7e409d1c2e3f83f79b82e6f124ae2737b441c76fc6f68e51a45aac327d719d66c4fc11440db")
b2sums=("d49186b4b2921d73536d4565edbe8968e25fbf160df08579674ac5ab62c52e697b64335088a38af910e2fe0cfd229272fdf5566295f653d99e05b472a9b8425a")
b3sums=("62a92a636a2eb865ea077ff68834cfbf8b5e84f4f51998b00bfce33298cd612f")

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
