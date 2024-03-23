# Maintainer:  dreieck
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Tim Besard <tim.besard@gmail.com>

_pkgname=osmosis
pkgname="${_pkgname}-bin"
pkgver=0.49.2
pkgrel=2
pkgdesc="Command line Java application for processing OSM data."
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Osmosis"
license=('LicenseRef-Public-Domain')
depends=(
  'java-runtime'
)
makedepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=(
  "${_pkgname}<=0.49.1" # There was a package 'osmosis' in the AUR which in reality was just this pre-built package.
)
source=(
  "${_pkgname}-${pkgver}.zip::https://github.com/openstreetmap/osmosis/releases/download/${pkgver}/osmosis-${pkgver}.zip"
  'osmosis.sh'
)
sha256sums=(
  '6950f1dfdbe4337ad193b0501309351426c403fab770061c9ddca9a28aefc26d'
  '1166f979471cad4033ededda7167d52df8d70ee3eed01a43b971b452637683ce'
)


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -dvm755 "${pkgdir}/usr/share/${_pkgname}"
  cp -rv bin lib script "${pkgdir}/usr/share/${_pkgname}"/

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" changes.txt readme.txt
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" copying.txt
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt" "${pkgdir}/usr/share/doc/${_pkgname}/copying.txt"

  install -Dvm755 "${srcdir}/osmosis.sh" "${pkgdir}/usr/bin/osmosis"
}
