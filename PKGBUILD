# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pkgname='dippi'
pkgname='dippi-git'
pkgver=4.1.0.r3.geb0eab7
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('x86_64')
url='https://github.com/cassidyjames/dippi'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
