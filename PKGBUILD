# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-maps-thunderforest
pkgname="${_pkgname}-git"
epoch=0
pkgver=r14.20250522.627ff63
pkgrel=1
pkgdesc="Maps served by thunderforest for KDE marble. API key required and asked for during build."
url="https://gitlab.com/dreieckli/marble-maps-thunderforest"
arch=('any')
license=(
  'custom: Public Domain'
  'custom: Thunderforest/ OSM.'
)
groups=()
depends=(
  'marble-common'
)
makedepends=(
  'bash'
  'git'
)
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
options=('emptydirs')
source=(
  "${_pkgname}::git+https://gitlab.com/dreieckli/marble-maps-thunderforest.git"
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
  cp -rv build/thunderforest-* "${pkgdir}/usr/share/marble/data/maps/earth/"

  install -v -D -m644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -v -D -m644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.TXT"
}
