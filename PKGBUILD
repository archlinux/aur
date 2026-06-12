# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="qdl"
pkgname="${_pkgname}-bin"
pkgver=2.7
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/linux-msm/${_pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'libusb'
  'libxml2-legacy'
  'libzip'
)
makedepends=(
  'patchelf'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-binary-ubuntu-24-arm64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-arm64.zip"
)
source_x86_64=(
  "${_pkgsrc}-binary-ubuntu-24-x64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-x64.zip"
)
sha256sums=('ffa224ea148c77d1f8d46007d421d5cef7b27e594f8e9efc969bd3e8f191707f'
            '85814c88fc75be2523c03551ee2abefc0c30b423edda343197796e0c0e168058')
sha256sums_aarch64=('b3a876cc6d573828488c452b61ab1ada553bbc94233b4f00f220aca77a1c8a35')
sha256sums_x86_64=('caecf36575d723a5c812e3c12e0bf917f5386ca719449d5f67308533f30df97b')

prepare() {
  cd "${srcdir}"
  patchelf --replace-needed 'libzip.so.4' 'libzip.so.5' "${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
