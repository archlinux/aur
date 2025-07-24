# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=rust-hypervisor-firmware
pkgver=0.5.0
pkgrel=2
pkgdesc="Rust Hypervisor Firmware"
url="https://github.com/cloud-hypervisor/rust-hypervisor-firmware"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --locked --release \
      --target ${CARCH}-unknown-none.json \
      -Zbuild-std=core \
      -Zbuild-std-features=compiler-builtins-mem
}

package() {
    install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}/" \
        "${srcdir}/${pkgname}-${pkgver}/target/${CARCH}-unknown-none/release/hypervisor-fw"
}

sha512sums=('367c01cae3e93c19b869c9b2af67d23d1d74601741472531f3e77428eb609da805f59512a7e2270b0944e8d39a9ff15f6ab9364a61f5d371153d16e52e48f4d5')
