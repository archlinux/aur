# Maintainer: Your Name <youremail@domain.com>

pkgname=gnome-console
_pkgname=console
pkgver=0.4.0
pkgrel=2
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/console"
license=('GPL3')
depends=('libgtop' 'libhandy' 'vte3')
makedepends=('meson' 'sassc')
optdepends=('libnautilus-extension')
checkdepends=('appstream-glib')
conflicts=('kgx')
replaces=('kgx')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('d672913784e56f426567b9cc32e6c05cf7bda6a25620404b6cb0657033c5d0918b958144b2b2468789a5d7994607a625d5a5ab9c6d549a623eabf5df32c9df7f')

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
