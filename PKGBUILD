# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
pkgname=wordbook
pkgver=0.6.0
pkgrel=1
pkgdesc="A dictionary application built for GNOME."
arch=('any')
url="https://apps.gnome.org/Wordbook"
license=('GPL-3.0-or-later')
depends=(
  'espeak-ng'
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
  'python-pydantic'
  'python-rapidfuzz'
  'python-wn'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Wordbook-$pkgver.tar.gz::https://github.com/mufeedali/Wordbook/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2dbd51785476bcf933a3dbcecbb97f60a2dfc987f4b5b00108deb4be2e0052a2')

build() {
  arch-meson "Wordbook-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
