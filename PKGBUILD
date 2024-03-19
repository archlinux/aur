# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='storcli'
_name='STORCLI_SAS3.5_P'
pkgver='007.2904.0000.0000'
pkgrel='2'
_phase='30'
pkgdesc="CLI program for LSI MegaRAID cards"
url='https://www.broadcom.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
source=("https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_nvme_12g_p${_phase}/${_name}${_phase}.zip")
sha256sums=('dafaa8ae83aae9c50ddfbfb86321b91d1eba36357eb33009c25776e2efe75519')

_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "Linux" || echo -n "ARM/Linux")
_filearch=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "noarch" || echo -n "${CARCH}")

prepare() {
  bsdtar -xf "${_name}${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/${_archstr}/${pkgname}-${pkgver}-1.${_filearch}.rpm"
}

package() {
  install -Dm0755 "opt/MegaRAID/${pkgname}/${pkgname}64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0755 -d "${pkgdir}/opt/MegaRAID/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}64"

  install -Dm0644 "${_name}${_phase}/univ_viva_cli_rel/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
