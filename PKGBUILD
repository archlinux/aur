# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=xcursor-perspective
pkgver=1.1
pkgrel=1
_ocsid=999679
_fileidx=1
pkgdesc="White, traditional, high contrast cursor theme made for Plasma Next"
arch=('any')
url="https://www.pling.com/p/${_ocsid}/"
depends=('libxcursor')
makedepends=('libxml2')
options=('!debug')
# the acutal download URL changes occasionally, so we have to use the API to fetch it
source=("${pkgname}_dl.xml::https://api.kde-look.org/ocs/v1/content/download/${_ocsid}/${_fileidx}"
        "index.theme")
sha256sums=('SKIP'
            '2380ccb9b9cc6a0099410113c58953d66d5adfed7700e06b6319b8a0da7d3f09')

prepare() {
  echo -n ' '; msg "$(gettext "Retrieving sources...")"
  cd "${startdir}"
  _downloadlink=$(xmllint --xpath '//ocs/data/content[@details="download"]/downloadlink/text()' "${srcdir}/${pkgname}_dl.xml")
  _netfile="${pkgname}-${pkgver}.tar.gz::${_downloadlink}"
  download_file "${_netfile}"

  echo -n ' '; msg "$(gettext "Validating %s files with %s...")" "source" "sha256sums"
  verify_integrity_one "${_netfile}" sha256 "e9974a1d29360ebf22324d36014f3406ddae6272476a3c11af5101e686e84f81"

  echo -n ' '; msg "$(gettext "Extracting sources...")"
  cd "${srcdir}"
  extract_file "${_netfile}"
}

package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/Perspective" "${pkgdir}/usr/share/icons"
  install -Dm644 "${srcdir}/index.theme" "${pkgdir}/usr/share/icons/Perspective/index.theme"
}
