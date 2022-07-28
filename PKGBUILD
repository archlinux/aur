# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple note taking"
arch=('x86_64')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('eefeb81e77179776f8c6ee4db321a599fcd69390d04eae747a13a5223572ef89227a40f70f6c177cac0f553f58bf68843ebd07f01a8600da2d71fab79bad4eef')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
