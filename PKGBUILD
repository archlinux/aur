# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='arcconf'
_pkgname='Arcconf'
_pkgrel='26273'
pkgver="4.16.00.${_pkgrel}"
_rpmver="4.16-${_pkgrel}"
pkgrel='1'
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
url='https://storage.microsemi.com/en-us/support'
license=('custom')
source=("https://download.adaptec.com/raid/storage_manager/${pkgname}_B${_pkgrel}.zip")
sha256sums=('0680ee9b4f9371fb1901f842af0814ba71a694ef39a4e8bac3f325994c400425')

_variant_aarch64='linuxarm_x64/rpm'
_variant_x86_64='linux_x64/rpm'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar xf "linux/${_archstr}/${_pkgname}-${_rpmver}.${CARCH}.rpm"
}

package() {
  install -Dm0755 "usr/${_pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "usr/${_pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
