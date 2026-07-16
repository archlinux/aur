# Maintainer:  WGB5445 <wgb98512@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.75.2
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

sha256sums_x86_64=('95519fcb14ff444174952ec68950d6baaa96f4f619578269dbd7f5f5d24b9658')
sha256sums_aarch64=('60ba94ec32eac1e67b2c98026c794c3aab769f3ae914c7a642ad4c352a8b9d34')

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
