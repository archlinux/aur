# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributorr: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='netsleuth'
pkgver=1.1.5
pkgrel=1
pkgdesc='Simple utility for calculating and analyzing IP subnet values'
arch=('any')
url='https://github.com/vmkspv/netsleuth'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'glib2'
  'hicolor-icon-theme'
  'libadwaita'
  'python'
  'python-gobject'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6788922a3e58a355b002fc6128f4ed2361cf99d381ec3db38fabcfee57b615b5')

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

