# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='storcli'
pkgver='007.2806.0000.0000'
pkgrel='1'
_phase='29'
pkgdesc="CLI program for LSI MegaRAID cards"
url='https://www.broadcom.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
source=("https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_nvme_12g_p${_phase}/STORCLI_SAS3.5_P${_phase}.zip")
sha256sums=('087f13a1a21f1e05cfd697a314dce642838b9b1c40a74c48a2ec8640c944c8dd')

_variant_aarch64='ARM/Linux'
_variant_x86_64='Linux'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar -xf "STORCLI_SAS3.5_P${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/${_archstr}/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm"
}

package() {
  install -Dm0755 "opt/MegaRAID/${pkgname}/${pkgname}64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0755 -d "${pkgdir}/opt/MegaRAID/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}64"

  install -Dm0644 "${srcdir}/STORCLI_SAS3.5_P${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
