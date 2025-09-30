# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scorecard"
pkgname="${_pkgname}-bin"
pkgver=5.3.0
pkgrel=2
pkgdesc="Security health metrics for Open Source"
arch=('aarch64' 'x86_64')
url="https://scorecard.dev"
_url="https://github.com/ossf/${_pkgname}"
license=('Apache-2.0')
makedepends=(
  'slsa-verifier'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-multiple.intoto.jsonl::${_url}/releases/download/v${pkgver}/multiple.intoto.jsonl")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums=('d028d0ddc0d4826c18d4c8324338ab50161cf1870596666fc26b41b4925dcc42')
sha256sums_aarch64=('2cecb8fece8bcb6ec5cedb0c042a10a04a23f5037e20b01d7fb07eaf8e6b6e94')
sha256sums_x86_64=('98351e001a2bae1d12ec6fbca7da42168bdda2eecbb4fa6951ebffb5ced3a0be')

verify() {
  slsa-verifier verify-artifact "${_pkgsrc}-${CARCH}.tar.gz" \
    --provenance-path "${_pkgsrc}-multiple.intoto.jsonl" \
    --source-uri "${_url#https://}" \
    --source-tag "v${pkgver}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
