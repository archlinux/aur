# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='inspector'
pkgname="${_pkgname}-git"
pkgver=0.2.0.r27.g80bcbfa
pkgrel=1
pkgdesc='Gives information about your system'
arch=('any')
url='https://github.com/Nokse22/inspector'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'python-gobject'
  'python-markdown-it-py'
  'python-weasyprint'
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
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "${pkgdir}"
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

