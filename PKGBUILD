# Maintainer: MrGilfy <mrgilfy@duck.com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=leggio
pkgver=0.4.3
pkgrel=1
pkgdesc="Sheet music viewer built for use at arm's length"
arch=('any')
url="https://github.com/MrGilfy/leggio"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'gtk4'
  'libadwaita'
  'poppler-glib'
  'hicolor-icon-theme'
)
# Nothing is compiled and the Makefile needs no build backend, so there are
# no makedepends. The icons are committed to the repository rather than
# rasterised here, which is what would otherwise pull in librsvg.
makedepends=()
# The release asset built by .github/workflows/release.yml, not GitHub's
# auto-generated archive: the workflow publishes the checksum of this exact
# file, so there is no ambiguity about which tarball the sum belongs to.
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('94ec99dbad4a2a33d279fb63223233838520c5ba0e40cee4792f5534ddb06c63')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
