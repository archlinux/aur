# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.8.1
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib' 'reuse')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('42e3a71a6350e2a9f3fada30656f9532c7ba21e53c0fd8667e1c129fd1921960ff49f639e2e69abd1cc9888e0923129d4d282087a687e75235c742d4390d807d')

build() {
  arch-meson --buildtype release "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
