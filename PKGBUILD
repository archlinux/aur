# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Skythrew <mael.guerin@murena.io>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=eartag
pkgver=0.6.2
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/World/eartag"
license=('MIT')
depends=(
  'chromaprint'
  'libadwaita'
  'python-gobject'
  'python-magic'
  'python-mutagen'
  'python-pillow'
  'python-pyacoustid'
  'python-requests'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
checkdepends=(
  'python-pytest'
)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2684a34550c43fda7f42f6ae49feac80ca21e843cd3503012eff58bda17383ed')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname-$pkgver"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
