# Maintainer:  WGB5445 <wgb98512@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.47.1
pkgrel=1
pkgdesc="A next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model"
arch=('x86_64' 'aarch64')
url="https://github.com/MystenLabs/sui"
_url="https://github.com/MystenLabs/${_pkgname}"
license=('Apache-2.0')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/mainnet-v${pkgver}/${_pkgname}-mainnet-v${pkgver}-ubuntu-x86_64.tgz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/mainnet-v${pkgver}/${_pkgname}-mainnet-v${pkgver}-ubuntu-aarch64.tgz")
prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}/bin"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" -C "${srcdir}/${_pkgsrc}-${CARCH}/bin"
}

package() {
  cd "${srcdir}"
  cd "${_pkgsrc}-${CARCH}"
  find "bin" -type f -exec install -vDm755 "{}" "${pkgdir}/local/usr/{}" \;
}
