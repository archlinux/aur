# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='storcli'
pkgver='007.2703.0000.0000'
pkgrel='1'
_phase='28'
pkgdesc="CLI program for LSI MegaRAID cards"
url='https://www.broadcom.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
source=("https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_nvme_12g_p${_phase}/STORCLI_SAS3.5_P${_phase}.zip")
sha256sums=('c15ef2d5b66f1d5988aa2bc318c49025f248d69058533e02a8f0acc86681cc85')

_variant_aarch64='ARM/Linux'
_variant_x86_64='Linux'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar -xf "STORCLI_SAS3.5_P${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/${_archstr}/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm"
}

package() {
  install -Dm755 "opt/MegaRAID/${pkgname}/${pkgname}64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 -d "${pkgdir}/opt/MegaRAID/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}64"

  install -Dm644 "${srcdir}/STORCLI_SAS3.5_P${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
