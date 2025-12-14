# Maintainer: Robert Greener <dev at r0bert dot dev>

pkgname=libpamtpmpin
pkgver=0.0.3
pkgrel=1
pkgdesc="PAM module for TPM2 PIN authentication"
arch=('x86_64' 'aarch64')
url="https://github.com/0xr0bert/libpamtpmpin"
license=('BSD-3-Clause')
depends=('pam' 'tpm2-tss')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0xr0bert/libpamtpmpin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99687d0cafe665ecad036218512c475df5d44d388d35be69c47be3e6947c2c5d')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod u+s "$pkgdir/usr/lib/tpmpin-unblock-self"
}
