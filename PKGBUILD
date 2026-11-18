# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chronytop-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="TUI for chrony NTP time server monitoring"
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'riscv64')
url="https://github.com/geerlingguy/chronytop"
license=('MIT')
# Runs /usr/bin/chronyc; the binary itself is static (CGO_ENABLED=0).
depends=('chrony')
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
sha256sums_x86_64=('1bfa7bcb0b76ccd69978123c7e58008955ceb9c235afb0b0e5f375c6802647b9')
sha256sums_aarch64=('3da788e9b6a33dd50c1c128017523a3f9550610edd93255fcd29657d9f42f8c8')
sha256sums_armv7h=('1edfb78a18a802ec2b79bf214a155d73d9fd3ab7447727adf81fe796ca39dd68')
sha256sums_i686=('c7d0b43c63cc4ee7227bd47f520f60b3fcd2a33f2e61eec16847326ca57b79ac')
sha256sums_riscv64=('73e64a3aba081b6e451d92f7bf68c0dd4b9d78a74b63c03e3fc45a252723a002')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chronytop"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
