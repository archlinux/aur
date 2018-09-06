# Maintainer: dreieck

pkgname=widelands-maps-einstein
_pkgver_year=2016
_pkgver_month=06
_pkgver_day=27
pkgver="${_pkgver_year}${_pkgver_month}${_pkgver_day}"
pkgrel=2
pkgdesc="Maps for widelands by user 'einstein'."
arch=('any')
url="http://wuatek.no-ip.org/~rak/widelands/?page=2"
license=('GPL2')
optdepends=(
  "widelands: To play the game."
)
source=(
  "PackageXL.zip::http://wuatek.no-ip.org/~rak/widelands/respondDownload.php?link=PackageXL_${_pkgver_year}-${_pkgver_month}-${_pkgver_day}"
)
sha256sums=(
  "c58c08a1057404e767b3c13eaa7f35907a24ebd3bc436d851a37a7da5a3a01fd"
)

build() {
  cd "${srcdir}"

  # To not change the upstream source, work in a build directory:
  mkdir "${srcdir}/build"
  cp -a "${srcdir}/PackageXL"/*.wmf "${srcdir}/build"/

  # Set permissions:
  chmod 644 "${srcdir}/build"/*.wmf

  # Remove maps which are already present in the official stable widelands build -- do avoid duplication:
  rm -fv "${srcdir}/build"/{Calvisson,Impact,Wideworld}.wmf
}

package() {
    cd "${srcdir}/PackageXL"

    # Create target directory:
    install -v -d -m755 "${pkgdir}/usr/share/widelands/maps/einstein"

    # Copy maps to target directory:
    cp -v "${srcdir}/build"/*.wmf "${pkgdir}/usr/share/widelands/maps/einstein"/
}
