# Maintainer: dreieck

_pkgname="chdk-licks"
pkgname="${_pkgname}-bin"
pkgver=1.07
pkgrel=1
epoch=0
pkgdesc="Linux Installer for CHDK and SDM."
arch=(
  any
)
url="http://www.zenoshrdlu.com/licks/licks.html"
license=(
  'custom: freeware'
)
groups=(
  'chdk'
)
depends=(
  'bash'
  'java-runtime'
)
makedepends=()
checkdepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "licks_${pkgver}.zip::http://www.zenoshrdlu.com/licks/licks.zip"
  "${_pkgname}_${pkgver}.html::${url}"
  "run-licks.sh"
  "license-info.txt"
)
noextract=()
sha256sums=(
  '6e38ccdf481a407da62d8256d9491cddca0b54806be7830321bcf2b0e1c1af45'
  '0617c7e267bd8b670b462e0ef1ed4db10d0ead90243d4a06be97f5b0777ca9a0'
  '311d27011684e67a8b38054aa566587609b8f00ae1c1671f1e7c54c47c8fc183'
  '70a54171def0e302f0555a770aba7f2ebc4afab010cab573b61c95b3f0300afc'
)
validpgpkeys=()


prepare() {
  printf '%s\n' "${url}" > "${srcdir}/website.url"
}

package() {
  install -v -m644 -D "${srcdir}/licks.jar"     "${pkgdir}/usr/lib/licks/licks.jar"
  install -v -m755 -D "${srcdir}/run-licks.sh"                  "${pkgdir}/usr/bin/licks"

  install -v -m644 -D "${srcdir}/${_pkgname}_${pkgver}.html"         "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}.html"
  install -v -m644 -D "${srcdir}/website.url"              "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m644 -D "${srcdir}/license-info.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-info.txt"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sfv "/usr/share/licenses/${pkgname}/COPYING-info.txt"     'COPYING-info.txt'
}
