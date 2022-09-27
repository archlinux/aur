# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=libpanel
pkgver=1.0.1
pkgrel=1
pkgdesc='A dock/panel library for GTK 4'
arch=('x86_64')
url='https://gitlab.gnome.org/GNOME/libpanel'
license=('GPL3')
depends=('libadwaita' 'gobject-introspection')
makedepends=('meson' 'gi-docgen' 'vala')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('b120b5e66b148a8a812fe7afb57d9b1ce855924fde78b9d89c91cfe45e90e8613b51b0881366f108e0ea53e651505c352d7c732f061e8d2206576b616a5de5e9')

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
