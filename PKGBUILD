# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette
pkgver=0.2.0
pkgrel=5
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 x86_64)
url="https://gitlab.gnome.org/Rirusha/${pkgname^}"
license=(GPL-3.0-only)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gst-plugins-good
  gtk4
  hicolor-icon-theme
  libadwaita
  libgee
  libxml2
  sqlite
  webkitgtk-6.0
)
makedepends=(
  blueprint-compiler
  meson
  vala
)
options=(!debug)
source=($url/-/archive/ver-$pkgver/${pkgname^}-ver-$pkgver.tar.gz)
b2sums=('81972f10843cecfc7adccc4493fc4dbd722b3d74fb54d18daf393d56a06d6e65f08720d94388b152af552afecdf2dbf888845148d858fa672d4f7d8e81c82c23')

prepare(){
  #Quick fix after release: https://gitlab.gnome.org/Rirusha/Cassette/-/commit/64d69b910177675b3cbce398a18b605d14928be0
  sed -i 's/Categories=Audio/Categories=GNOME;GTK;Music;Audio;AudioVideo;/' ${pkgname^}-ver-$pkgver/data/io.github.Rirusha.Cassette.desktop.in
}

build() {
  arch-meson ${pkgname^}-ver-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
