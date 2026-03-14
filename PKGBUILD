# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='netsleuth'
pkgver=1.1.3
pkgrel=2
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
sha256sums=('5617b762dea49cc4063cc64eced49d55da441bc5e6474424b69599e4cdf6a207')

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

