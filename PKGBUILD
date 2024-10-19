pkgname=libspeechprovider
pkgver=1.0.3
pkgrel=1
pkgdesc="A utility library for creating Spiel speech providers"
url="https://project-spiel.org/libspeechprovider"
arch=(x86_64)
license=(LGPL-2.1-only)
depends=(glibc glib2)
makedepends=(git meson gobject-introspection gi-docgen glib2-devel)
source=("git+https://github.com/project-spiel/${pkgname}.git#tag=SPEECHPROVIDER_${pkgver//./_}")
b2sums=('a271e0ad5d3e34787a82420d1d15837953f8347dcd55696b969dfcb94037b7a20df0ce26bbea227a076e7a30c3abb97516ff9d8dbba32e8f5d500d2607aca1d1')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

