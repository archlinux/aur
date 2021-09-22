# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=dspy
_pkgname=d-spy
pkgver=1.0.0
pkgrel=1
pkgdesc="It's like d-feet, but written in C and blisteringly fast. Also comes with a library for IDE integration"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/d-spy"
license=('GPL3')
depends=('gtk4' 'libadwaita')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha512sums=('2b8156fa8a5c35f22c70f111f7ecbb6c86439527b00da65dcbff0c05bbb61c4202bc6f5637831e5cb8471d97fcc56182f38bb10263070343ded70abcf8332915')

build() {
  arch-meson "${_pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
