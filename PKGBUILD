# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
)
sha512sums=(
  '3caa006e66c789cc9c7490e9124f764f2fd2e8fbfc5b8d588e0378523b73e028b60cd603cfbdefd9f6acdcc9b128129050c34a1548fa70bb10126415d42951d0'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/cloud-hypervisor
}
