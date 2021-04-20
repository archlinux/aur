# Maintainer: Vlad Petrov <ejiek@mail.ru>

pkgname=kgx
pkgver=0.2.1
pkgrel=1
pkgdesc='Simple user-friendly terminal emulator for the GNOME desktop'
url='https://gitlab.gnome.org/ZanderBrown/kgx'
license=('GPL3')
arch=('x86_64')
depends=('libgtop' 'libhandy0' 'vte3')
makedepends=('appstream-glib' 'meson')
source=("https://gitlab.gnome.org/ZanderBrown/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('70a814b0baf70049d5a20791d58a32e92661428d2deeeb56d91b81cc4dc5e81a')


build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
