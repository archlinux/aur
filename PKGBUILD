# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chronytop-bin
pkgver=0.5.1
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
sha256sums_x86_64=('7897d3beeed3edee94f5565bc6f611541bbbdb371721f032ac799e161fb4734d')
sha256sums_aarch64=('3b49eac34c38eb42285686f67f69eddb4225d4849a671b3a0d204edc31631b02')
sha256sums_armv7h=('7fcafede57213407452aef134d1b89fe23b4d5df3c57911683f0801ec58a6321')
sha256sums_i686=('2c0a572198784b45a4afeebb2d0e0befbbb49b992248be774c7018c828232a19')
sha256sums_riscv64=('fcc970d28df7e6b1e301f784ea3476dad3bf8dbfbd28fa042b2c8bd7c28ccef0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chronytop"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
