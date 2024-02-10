# Maintainer: Sich <little_sich@tuta.io>
pkgname=zenity-gtk3
pkgver=3.44.3
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts. GTK3 version."
url="https://gitlab.gnome.org/GNOME/zenity"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=('gtk3' 'perl')
makedepends=('help2man' 'meson' 'util-linux' 'yelp-tools')
conflicts=('zenity')
provides=('zenity')
source=(https://gitlab.gnome.org/GNOME/zenity/-/archive/${pkgver}/zenity-${pkgver}.tar.gz)
sha512sums=('786b7d22185719a53110fb7c31d6dc3fce232d4f01763ebdf10fc175e0f4495285a7cfb17d3b786b03e2550313e2d255fe93f5b0bc0b5df069d04f848cadfcae')

prepare() {
  cd "${srcdir}/zenity-${pkgver}"
}

build() {
  arch-meson zenity-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
