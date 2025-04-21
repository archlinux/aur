# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="html2md"
pkgname="${_pkgname}-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="HTML to Markdown converter"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/suntong/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv7h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums=('54f4728d9e0588471b7d137f68377638829d6ce1c6f6bb914e1ea2ac178493c4'
            '011a54200f504dde82ae133dc5d9bab66f52566d34ac372faee08162f1d97007')
sha256sums_aarch64=('f06dae61a4e19e8c5cd0445415ec5ab0bb9b14b0cf84db8e245804d5d53ceaff')
sha256sums_armv7h=('9f567d7177ef3adc66324ee79943f6634c232eaffa4a8042023b989b790902e1')
sha256sums_x86_64=('9680174289932a8426974701b9f2437071ffea559682658161865a44e3b1e323')

case "${CARCH}" in
  aarch64)
    _arch="amd64"
    ;;
  armv7h)
    _arch="armv6"
    ;;
  x86_64)
    _arch="amd64"
    ;;
esac

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc//-/_}_linux_${_arch}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
