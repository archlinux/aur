# Maintainer: CPT-Dawn <dawnsp0456@gmail.com>
pkgname=nexus-nm
pkgver=1.0.0
pkgrel=3
pkgdesc="A beautiful modern TUI WiFi manager for Arch Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Nexus"
license=('MIT')
depends=('glibc' 'networkmanager' 'dbus')
makedepends=('cargo' 'rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CPT-Dawn/Nexus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a236f41345374486bb7fd2abe75607cbc9e490914b12ef13a7c29ccd58c0d60')

build() {
  cd "Nexus-${pkgver}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked
}

package() {
  cd "Nexus-${pkgver}"
  install -Dm755 "${srcdir}/target/release/nexus" "${pkgdir}/usr/bin/nexus"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
