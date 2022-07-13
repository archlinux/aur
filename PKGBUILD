# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-console
_pkgname=console
pkgver=42.1
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
b2sums=('bd6eeaac31ec071bb24957ffbcb479c0a1cc1f1f41db4c35fbf537544aa00930bdeb721838992e444164f43f918f78b416d9defd0d66922d5d7b1cd63a18c10b')

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
