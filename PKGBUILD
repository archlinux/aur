# Maintainer: Marek <mail@marek.onl>

pkgname=zebrad
pkgver=1.4.0
pkgrel=1
pkgdesc="Zcash - Financial Privacy in Rust 🦓"
url='https://github.com/ZcashFoundation/zebra'
source=("zebra-${pkgver//_/-}.tar.gz::https://github.com/ZcashFoundation/zebra/archive/refs/tags/v${pkgver//_/-}.tar.gz")
arch=('aarch64' 'x86_64')
license=('Apache' 'MIT')
makedepends=('rust' 'clang' 'pkgconf')
sha256sums=(SKIP)

build () {
  cd "zebra-$pkgver"

  # Build Zebra.
  cargo build --locked --release --features sentry --package zebrad --bin zebrad --target-dir target
}

package() {
  cd "zebra-$pkgver"

  # Install the binary.
  install -Dm 755 target/release/zebrad "${pkgdir}/usr/bin/${pkgname}"

  # Install documentation.
  install -Dm 644 CHANGELOG.md       -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 CODE_OF_CONDUCT.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 CONTRIBUTING.md    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 README.md          -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 SECURITY.md        -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install licenses.
  install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
