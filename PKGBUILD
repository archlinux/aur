# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem
pkgver=0.2
pkgrel=1
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('dd27aa77c06c548e762e5a2e14b8cf020417f0eff2b486649dde5750db4c7b088d073f9f2789816fe766a122f37ca56756bd6b897b1b2929f34c1d3e26fe9d5c')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
