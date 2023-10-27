# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='arcconf'
_pkgname='Arcconf'
_pkgrel='26064'
pkgver="4.14.00.${_pkgrel}"
_rpmver="4.14-${_pkgrel}"
pkgrel='1'
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
url='https://storage.microsemi.com/en-us/support'
license=('custom')
source=("https://download.adaptec.com/raid/storage_manager/${pkgname}_B${_pkgrel}.zip")
sha256sums=('c2421744793a998fca44ff1b47d510e7611363bb2833655c001bbb336dbdd24c')

_variant_aarch64='linux/arm/linuxarm_x64/rpm'
_variant_x86_64='linux/rpm'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar xf "${_archstr}/${_pkgname}-${_rpmver}.${CARCH}.rpm"
}

package() {
  install -Dm755 "usr/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "usr/${_pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
