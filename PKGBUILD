# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

_pkgname=jalgo
pkgname="${_pkgname}-doc-git"
pkgver=r524.20201117.f59fbbd
epoch=1
pkgrel=1
pkgdesc="Algorithm visualization tool written in Java developed at TU Dresden: Documentation."
arch=('any')
url="https://github.com/tud-fop/j-Algo"
license=('GPL2')
depends=()
makedepends=()
optdepends=(
  "jalgo: For the software this package documents."
)
provides=(
  "jalgo-doc=${pkgver}"
)
conflicts=(
  'jalgo-doc'
)
source=(
  "${_pkgname}::git+https://github.com/tud-fop/j-Algo.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(git describe --tags | sed 's|^v||' | sed 's|\-[^-]*$||' | tr '-' '_')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  if [ -n "${_rev}" ]; then
    printf %s "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -v -m644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  install -d -v -m644 "${pkgdir}/usr/share/doc/${_pkgname}/doc"

  cp -rv "${srcdir}/${_pkgname}/doc"/* "${pkgdir}/usr/share/doc/${_pkgname}/doc"/
}
