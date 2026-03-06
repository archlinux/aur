# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-maps-scandinavia
pkgname="${_pkgname}-git"
epoch=0
pkgver=r12.20260306.8463cb1
pkgrel=1
pkgdesc="Maps for Denmark (incl. Greenland), Sweden and Norway (incl. Svalbard and Jan Mayen) for KDE marble. For some maps, credentials are required and asked for during build."
url="https://codeberg.org/dreieck/marble-maps-scandinavia"
arch=('any')
license=(
  'LicenseRef-Public_Domain'
  'ODbL-1.0'
  'CC-BY-SA-3.0'
  'LicenseRef-SRTM'
  'LicenseRef-Sonny'
)
groups=('marble-maps')
depends=(
  'marble-common'
)
makedepends=(
  'curl'
  'bash'
  'git'
  'sed'
  'xq'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "marble-maps-denmark-topo"
  "marble-maps-denmark-ortofoto"
  "marble-maps-denmark-roads"
  "marble-maps-greenland-topo"
  "marble-maps-greenland-ortofoto"
  "marble-maps-sweden-topo"
  "marble-maps-sweden-ortofoto"
  "marble-maps-norway-topo"
  "marble-maps-norway-ortofoto"
  "marble-maps-norway-nautical"
  "marble-maps-svalbard-topo"
  "marble-maps-svalbard-ortofoto"
  "marble-maps-janmayen-topo"
)
conflicts=(
  "${_pkgname}"
  "marble-maps-denmark-topo"
  "marble-maps-denmark-ortofoto"
  "marble-maps-denmark-roads"
  "marble-maps-greenland-topo"
  "marble-maps-greenland-ortofoto"
  "marble-maps-sweden-topo"
  "marble-maps-sweden-ortofoto"
  "marble-maps-norway-topo"
  "marble-maps-norway-ortofoto"
  "marble-maps-norway-nautical"
  "marble-maps-svalbard-topo"
  "marble-maps-svalbard-ortofoto"
  "marble-maps-janmayen-topo"
)
replaces=()
options=('emptydirs')
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  printf '%s' "r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./build.sh
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -pv "${pkgdir}/usr/share/marble/data/maps/earth/"
  cp -rv build/* "${pkgdir}/usr/share/marble/data/maps/earth/"

  install -v -D -m644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -v -D -m644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.TXT"
}
