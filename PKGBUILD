# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='arcconf'
_pkgname='Arcconf'
pkgver='4.09.00.25611'
_pkgver='B25611'
_rpmver='4.09-25611'
pkgrel='1'
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
url='https://storage.microsemi.com/en-us/support'
license=('custom')
source=("https://download.adaptec.com/raid/storage_manager/${pkgname}_${_pkgver}.zip")
sha256sums=('6543b9d636e6e595bf51ac880ab17c5bd59c80bb27186b0f37f979f46914d669')

_variant_aarch64='linux_x64/arm/linuxarm_x64/rpm'
_variant_x86_64='linux_x64/rpm'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar xf "${_archstr}/${_pkgname}-${_rpmver}.${CARCH}.rpm"
}

package() {
  install -Dm755 "usr/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "windows_x64/cmdline/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
