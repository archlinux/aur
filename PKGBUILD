# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='storcli'
_name='STORCLI_SAS3.5_Point_P'
pkgver='007.2807.0000.0000'
pkgrel='1'
_phase='29'
pkgdesc="CLI program for LSI MegaRAID cards"
url='https://www.broadcom.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
source=("https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_nvme_12g_p${_phase}/${_name}${_phase}.zip")
sha256sums=('39112884605cac524676d1a23f92fcb1725ced9a4336e8779234b60446b13042')

_variant_aarch64='ARM/Linux'
_variant_x86_64='Linux'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar -xf "${_name}${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/${_archstr}/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm"
}

package() {
  install -Dm0755 "opt/MegaRAID/${pkgname}/${pkgname}64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0755 -d "${pkgdir}/opt/MegaRAID/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}64"

  install -Dm0644 "${_name}${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
