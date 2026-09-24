# Maintainer:  WGB5445 <wgb98512@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.80.1
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

sha256sums_x86_64=('97f9aed10e0c2fe3204ce4639ac992e1449b17c14f22f30e9f903ead54ac7336')
sha256sums_aarch64=('d257b82dbc7f84f84fa95f1aaae413b72813ffe728ccb5c1012e714929262f20')

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
