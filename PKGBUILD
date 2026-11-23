# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chronytop-bin
pkgver=0.6.0
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
sha256sums_x86_64=('91d3daefbc6cc103f1f6c67e9408baaa5159c3373d20d7f00800044919e6d3df')
sha256sums_aarch64=('48a448dfeb4e0ed2f71c6f0543daa2d2e8d44326214b0f031956a9a598e814c1')
sha256sums_armv7h=('02950813e17627b1da7fe00303629f5c5b3675f65c64632bbef5f34ac84daf22')
sha256sums_i686=('795591a1b4e96c468aae661c83ae4c0966c2d315fd9892b824b90b3fb7eb65b4')
sha256sums_riscv64=('847e38b59db2e8f1ced9d79c2d5eb9b8656356908c66de2471c00466b84f2945')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chronytop"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
