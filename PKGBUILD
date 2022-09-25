# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-console
_pkgname=console
pkgver=43.0
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/console"
license=('GPL3')
depends=('libgtop' 'libadwaita' 'vte4')
makedepends=('meson' 'sassc' 'libnautilus-extension')
checkdepends=('appstream-glib')
conflicts=('kgx')
replaces=('kgx')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('37515d1a499ac7374d3fae89423b38340db8c752c8e637947940781fb82ee2d6017399f93c7f5dd809c90d64a0790eb147dfa9b47bc5781b690168d6d78950dc')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
