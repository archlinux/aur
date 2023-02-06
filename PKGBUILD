# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='storcli'
pkgver='007.2405.0000.0000'
pkgrel='1'
pkgdesc="CLI program for LSI MegaRAID cards"
url='https://www.broadcom.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
source=("https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_nvme_12g_p25/STORCLI_SAS3.5_P25.zip")
sha256sums=('006a99b7637d3f379e51b5f98dc61d4e726aed354c5d0aa710dcf540b6b50b40')

_variant_aarch64='ARM/Linux'
_variant_x86_64='Linux'
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_variant_x86_64}" || echo -n "${_variant_aarch64}")

prepare() {
  bsdtar -xf "STORCLI_SAS3.5_P25/univ_viva_cli_rel/Unified_storcli_all_os/${_archstr}/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm"
}

package() {
  mkdir -p "${pkgdir}/opt/MegaRAID/${pkgname}"
  install -Dm755 "opt/MegaRAID/${pkgname}/${pkgname}64" "${pkgdir}/usr/bin/${pkgname}"

  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}64"

  install -Dm644 "${srcdir}/STORCLI_SAS3.5_P25/univ_viva_cli_rel/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
