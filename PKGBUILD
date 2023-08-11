# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=rust-hypervisor-firmware
pkgver=0.4.2
pkgrel=1
pkgdesc="Rust Hypervisor Firmware"
url="https://github.com/cloud-hypervisor/rust-hypervisor-firmware"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
makedepends=('rust')
source=("${url}/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --locked --release \
      --target ${CARCH}-unknown-none.json \
      -Zbuild-std=core,alloc \
      -Zbuild-std-features=compiler-builtins-mem
}

package() {
    install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}/" \
        "${srcdir}/${pkgname}-${pkgver}/target/${CARCH}-unknown-none/release/hypervisor-fw"
}

sha512sums=('0e499c695c822b6cc5be82478c1b51c4f51e7cd46be10608acc34d9d3e0aee12cb0333310e918b3e3901b20bdbbfd858fc43bb35d16075fb02f213108a9b5cb0')
