# Maintainer: Kreuder <mk@singular.de>
pkgname=stenmark
pkgver=0.12.0
pkgrel=1
pkgdesc='Your markdown librarian. A GTK4 Markdown reader, organizer and editor'
arch=('any')
url='https://github.com/mkay/stenmark'
license=('GPL-3.0-only')
depends=(
  'python'
  'python-gobject'
  'python-markdown-it-py'
  'python-pygments'
  'python-yaml'
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'
)
makedepends=(
  'meson'
  'gettext'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkay/stenmark/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76c6fc51425f47fb1a9c7c9b2dbdcdd944fed208afcd1c5d0aebec0ada7d58eb')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
