# Maintainer: Lukáš Tyrychtr <lukastyrychtr@gmail.com>

pkgname=libspiel
pkgver=1.0.3
pkgrel=1
pkgdesc="Speech synthesis client library"
url="https://project-spiel.org/libspiel"
arch=(x86_64)
license=(LGPL-2.1-only)

depends=(dconf glibc glib2 gcc-libs gstreamer gst-plugins-base-libs)
makedepends=(git meson gobject-introspection gi-docgen glib2-devel)
source=("git+https://github.com/project-spiel/${pkgname}.git#tag=SPIEL_${pkgver//./_}")
b2sums=('a7a8e18143c0cdb9b7489ea348e469f2ac77222a19b71128055fd430ef5a9cc9f549bc74bdc77c124540720d03fdf60595afe40ea369ed634fd37d996d5a44d9')

prepare() {
  meson subprojects download --sourcedir=$pkgname
}


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

