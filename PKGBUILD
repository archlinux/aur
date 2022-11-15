# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=solunar2
pkgname=${_pkgname}-git
pkgver=2.0b.r10.7d0b06f
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
  printf "%s.r%s.%s" "$(grep -E '^[[:space:]]*VERSION[[:space:]]*:+=' "${srcdir}/solunar2/Makefile" | awk '{print $3}')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgname}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="usr"  -C "${_pkgname}" install
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
