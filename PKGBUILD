# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chronytop-bin
pkgver=0.5.0
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
sha256sums_x86_64=('688c617d980dbcb4c7139ce1c6d0914d0428c754ae5d81f43a275a96267dc503')
sha256sums_aarch64=('1eb60091c322ddfac7abda8e5dc1bc7a1f6a52e17d6cde7691025d7bf651c73c')
sha256sums_armv7h=('f2b3b408f7c920a33e414bba9c5f881df04e597ff186bb974d57f1ed9cbed72f')
sha256sums_i686=('bb6f3f91a629c26ad81e15c7662d8ad48f6047a8be19147c845eb6c603e3567d')
sha256sums_riscv64=('49d18f10efb4a9fbaa4a7070251147aabd659e332ae31f0b3a5dcac540be468c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chronytop"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
