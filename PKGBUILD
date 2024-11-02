# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="dnsx"
pkgname="${_pkgname}-bin"
pkgver=1.2.1
pkgrel=2
pkgdesc="Fast and multi-purpose DNS toolkit"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://docs.projectdiscovery.io/tools/dnsx"
_url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
sha256sums_x86_64=('7ff88172c1b108d0ccb25a315bcf3f267be4b9d360586b7e9f8799ad89727478')
sha256sums_aarch64=('fb96e9178c1b1e68a589b66398f268fc3836eb2c21fd346d11bb4f81cfa39044')
sha256sums_i686=('09a25943a4880f55d10a6aa11d81c32e3945adb9a8fbafad21a69b852a2a3978')
sha256sums_armv7h=('40934243c659aff73f6f5cc502099b3f5725d2c4408b893bd66cd18c2385285b')

prepare() {
  mkdir -p "${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  mv -f "${_pkgname}" "README.md" "LICENSE.md" "${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
