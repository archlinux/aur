# Maintainer:  WGB5445 <wgb98512@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.77.3
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

sha256sums_x86_64=('2bd68a4a22c0ab7758981b46bf92183dc11f68d95993be9f26bc11482514cc95')
sha256sums_aarch64=('3362dea9400a78cea48f0d4927e35950fee9d522656350510859ed52794713dd')

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
