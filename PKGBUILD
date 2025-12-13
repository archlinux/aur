# Maintainer: Robert Greener <dev at r0bert dot dev>

pkgname=libpamtpmpin
pkgver=0.0.1
pkgrel=1
pkgdesc="PAM module for TPM2 PIN authentication"
arch=('x86_64' 'aarch64')
url="https://github.com/0xr0bert/libpamtpmpin"
license=('BSD-3-Clause')
depends=('pam' 'tpm2-tss')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0xr0bert/libpamtpmpin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('907504e4f357dc240e5baec8da6e03735d54a765b551453c0790eece4f131962')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
