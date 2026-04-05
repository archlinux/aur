# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='netsleuth'
pkgver=1.1.4
pkgrel=1
pkgdesc='Simple utility for calculating and analyzing IP subnet values'
arch=('any')
url='https://github.com/vmkspv/netsleuth'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'python-gobject'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8621d3486a123a42fe43b0b3fed16345244a5c92d0ca8fb3a697c811cd16195b')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --no-rebuild --destdir "${pkgdir}"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

