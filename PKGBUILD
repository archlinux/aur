# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=password-for-gnome-vala
pkgver=1.4.0
pkgrel=1
pkgdesc="Calculator and random generator password for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/elescoute/password-for-gnome-vala"
license=('GPL3')
depends=('libadwaita' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('e809f25e5aba27ac3fc5df8c01432d5c20ceef6f4e200b8f4f6cba165667b6cd0c542ca180e2d068b62d5e7128ad2ab22aee7f57b0ef47bb408a218c523f9a8b')

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
