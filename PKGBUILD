# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sentencepiece"
pkgname="${_pkgname}-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=('x86_64')
url="https://github.com/google/${_pkgname}"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'protobuf'
)
provides=(
  "${_pkgname}=${pkgver}"
  "lib${_pkgname}"{,'_train'}'.so'
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.7z::${url}/releases/download/v${pkgver}/${_pkgsrc}-Linux-x86_64.7z")
sha256sums=('4d52487bc1fc01d5e2b2054be2861326dda7f0bfe42a6f4b46c0a6238f0951fd'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('654083fba04d00fdb1d7dcd7924c223f1962336244443fd60125fcf2c15fffb7')

prepare() {
  cd "${srcdir}/${_pkgsrc}-Linux-${CARCH}/lib/pkgconfig"
  sed -i 's|prefix=.*|prefix=/usr|g' "${_pkgname}.pc"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}/${_pkgsrc}-Linux-${CARCH}"
  install -vd "${pkgdir}/usr"
  cp -va --no-preserve=ownership ./* "${pkgdir}/usr"
}
