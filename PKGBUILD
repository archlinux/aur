# Maintainer:  WGB5445 <wgb98512@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.68.1
pkgrel=2
pkgdesc="A next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model"
arch=('x86_64' 'aarch64')
url="https://github.com/MystenLabs/sui"
_url="https://github.com/MystenLabs/${_pkgname}"
license=('Apache-2.0')
depends=()
makedepends=('debugedit' 'fakeroot')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
# noextract=("${_pkgsrc}-x86_64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tgz::${_url}/releases/download/mainnet-v${pkgver}/${_pkgname}-mainnet-v${pkgver}-ubuntu-x86_64.tgz")
source_aarch64=("${_pkgsrc}-aarch64.tgz::${_url}/releases/download/mainnet-v${pkgver}/${_pkgname}-mainnet-v${pkgver}-ubuntu-aarch64.tgz")

sha256sums_x86_64=('d2e4f3431ca3da13ebacfa91f69828c765352d1af608fb1cfa602d17625dbe7b')
sha256sums_aarch64=('96d649dcc7e0af3245cb8d151ac3e4bceb81c10dd51c66f61beb1cee4295ba48')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}/bin"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tgz" -C "${srcdir}/${_pkgsrc}-${CARCH}/bin"
}

package() {
  cd "${srcdir}"
  cd "${_pkgsrc}-${CARCH}"
  find "bin" -type f -exec install -vDm755 "{}" "${pkgdir}/usr/local/{}" \;
}
