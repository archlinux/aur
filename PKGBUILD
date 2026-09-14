# Maintainer: czyt <czytcn@gmail.com>

pkgname=lnav-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='A terminal log file viewer and analyzer (upstream static musl build)'
arch=('x86_64' 'aarch64')
url='https://github.com/tstack/lnav'
license=('BSD-2-Clause')
# The binary is static; ncurses supplies terminal definitions.
depends=('ncurses' 'ca-certificates')
optdepends=('wireshark-cli: read packet captures with tshark'
            'git: install and update log formats from Git repositories')
provides=("lnav=${pkgver}")
conflicts=('lnav')
options=('!strip' '!debug')

source=("lnav-${pkgver}-LICENSE::https://raw.githubusercontent.com/tstack/lnav/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/lnav-${pkgver}-linux-musl-x86_64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/lnav-${pkgver}-linux-musl-arm64.zip")
sha256sums=('7113b8b5d289fa2626798689991204e5cb2167b5d269eb148b96c642f9e26e6b')
sha256sums_x86_64=('ec1750f0a6962eed6bb85ad4249457894f190e961277c56d69c47eecce9e705e')
sha256sums_aarch64=('e605ac855af193b5c7201e2fd94372febec931c5721b50fdf828b3e5af90c677')

package() {
  local dist="${srcdir}/lnav-${pkgver}"
  install -Dm755 "${dist}/lnav" "${pkgdir}/usr/bin/lnav"
  install -Dm644 "${dist}/lnav.1" "${pkgdir}/usr/share/man/man1/lnav.1"
  install -Dm644 "${dist}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "${dist}/NEWS.md" "${pkgdir}/usr/share/doc/${pkgname}/NEWS.md"
  install -Dm644 "${srcdir}/lnav-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
