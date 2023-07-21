# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='arcconf'
_pkgname='Arcconf'
pkgver='4.11.00.25823'
_pkgver='B25823'
_rpmver='4.11-25823'
pkgrel='1'
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
url='https://storage.microsemi.com/en-us/support'
license=('custom')
source=("https://download.adaptec.com/raid/storage_manager/${pkgname}_${_pkgver}.zip")
sha256sums=('613c48100731dae1364d50872e37f2183d50a3c5f5339eea38f8dd168d60ab0b')

_variant_aarch64='linux_x64/arm/linuxarm_x64/rpm'
_variant_x86_64='linux_x64/rpm'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar xf "${pkgname}/${_archstr}/${_pkgname}-${_rpmver}.${CARCH}.rpm"
}

package() {
  install -Dm755 "usr/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "usr/${_pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
