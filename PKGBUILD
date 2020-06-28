# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=solunar2
pkgname=${_pkgname}-git
pkgver=r1.93ccb31
pkgrel=1
pkgdesc='Calculate sun and moon, rise and set times'
arch=('x86_64')
url='https://github.com/kevinboone/solunar2'
license=('GPL3')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname/2/}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgname}"
}

package() {
  install -d "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" PREFIX="usr"  -C "${_pkgname}" install
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
