# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=libpanel
pkgver=1.0.0
pkgrel=1
pkgdesc='A dock/panel library for GTK 4'
arch=('x86_64')
url='https://gitlab.gnome.org/chergert/libpanel'
license=('GPL3')
depends=('libadwaita' 'gobject-introspection')
makedepends=('meson' 'gi-docgen' 'vala')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('0986c241d82e09276552638ddebc17d95ca74af95e472cc839ebb19c3330bdbcf6dae4497b5a9c79a2d7ccc1bcca1d53df068518034f9a74b5ffaa21b5d0e676')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
