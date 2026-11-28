# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chronytop-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="TUI for chrony NTP time server monitoring"
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'riscv64')
url="https://github.com/geerlingguy/chronytop"
license=('MIT')
optdepends=('chrony: local chronyd to monitor')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# Prebuilt static binary built with -s -w: nothing to strip, no debug info.
options=('!strip' '!debug')
# Upstream checksums:
#   curl -sL ${url}/releases/download/v${pkgver}/SHA256SUMS
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/geerlingguy/chronytop/v${pkgver}/LICENSE")
# Upstream builds the arm binary with GOARM=7.
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/chronytop-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/chronytop-linux-arm64")
source_armv7h=("${pkgname}-${pkgver}-armv7h::${_dl}/chronytop-linux-arm")
source_i686=("${pkgname}-${pkgver}-i686::${_dl}/chronytop-linux-386")
source_riscv64=("${pkgname}-${pkgver}-riscv64::${_dl}/chronytop-linux-riscv64")
sha256sums=('bef1e846bdaac81614dda7bbedfa7bb2c1a2f177536aa0b4700deb38966efc90')
sha256sums_x86_64=('45ee320bdcc2b0e8c79f67aef3abde031a285e012812a943739bb52c12368c8f')
sha256sums_aarch64=('1442546ed90810a5c9bd960b1b7cb01c60ab382aa2fd99cea3c9fd7c71b4b5ed')
sha256sums_armv7h=('23462b7dc7223fd99407bd1eeaa24ac6dd87533ec3cae6d0184891ecf9fec853')
sha256sums_i686=('25304da2b5eb909420d3c50b02ab011f2eafe066720e4c566b7ae47040658285')
sha256sums_riscv64=('59da614fc7d1a1a5927e1b57f195d5f06d3faf6ce6a50d8f385498250469dac5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chronytop"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
