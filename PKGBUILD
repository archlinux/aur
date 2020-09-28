# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='prettifier'
pkgname="${_pkgname}-git"
pkgver=1.1.4.r2.gffc7138
pkgrel=1
pkgdesc='Simple application that makes your JSON/XML requests/responses prettier to read'
arch=('x86_64')
url='https://github.com/fleury08/prettifier'
license=('MIT')
depends=('granite' 'gtksourceview3')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 "${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
