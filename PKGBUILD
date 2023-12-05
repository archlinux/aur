# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='supermicro-update-manager'
_pkgname='sum'
pkgver='2.13.0'
_pkgver='633'
_pkgdate='20230825'
pkgrel='1'
pkgdesc='Supermicro Update Manager is used for managing and configuring the BIOS/BMC firmware'
arch=('x86_64')
depends=('gcc-libs' 'zlib')
_uri='https://www.supermicro.com'
url="${_uri}/en/solutions/management-software/${pkgname}"
license=('custom: EULA')
source=("${_uri}/Bios/sw_download/${_pkgver}/${_pkgname}_${pkgver}_Linux_x86_64_${_pkgdate}.tar.gz")
sha256sums=('b1b5c0007b73c06cdc945bef734d7210a1292320a2b35657663c41ff6f96393c')
backup=("etc/${_pkgname}rc")

prepare() {
  cd "${_pkgname}_${pkgver}_Linux_x86_64"
  sed -i 's|#journal_path = /home/administrator/journal/supermicro/test|journal_path = /var/log/'"${pkgname}"'|g' \
"${_pkgname}rc.sample"
}

package() { 
  cd "${_pkgname}_${pkgver}_Linux_x86_64"
  install -Dm644 "${_pkgname}rc.sample" "${pkgdir}/etc/${_pkgname}rc"
  install -Dm644 "ReleaseNote.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 -d "${pkgdir}/var/log/${pkgname}"
}
