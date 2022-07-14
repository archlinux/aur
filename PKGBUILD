# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-console
_pkgname=console
pkgver=42.2
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/console"
license=('GPL3')
depends=('libgtop' 'libhandy' 'vte3')
makedepends=('meson' 'sassc' 'libnautilus-extension')
checkdepends=('appstream-glib')
conflicts=('kgx')
replaces=('kgx')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('93b5339c48cf1d8597cf61227de3d3903a71fc39d651d2eedf9acf91b16a1bcf8cc2d377433ec4cb745a0d0ce78ad1cf8d9becc5239b8260f212371f5e4935d9')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
