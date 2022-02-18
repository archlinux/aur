# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-console
_pkgname=console
pkgver=42.beta
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/console"
license=('GPL3')
depends=('libgtop' 'libhandy-git' 'vte3-git')
makedepends=('meson' 'sassc')
optdepends=('libnautilus-extension')
checkdepends=('appstream-glib')
conflicts=('kgx')
replaces=('kgx')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('1144fe690906aa49e9190aecb4651edbe2b1c9cb7eba0a41a1dc99d629e21a079c4f28fd9313d6eafd9d2f6717fe4ede102007e566c834182afbf8f90e5fde72')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
