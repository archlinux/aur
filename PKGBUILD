# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=solanum
pkgver=4.0.0
pkgrel=1
pkgdesc="A pomodoro timer for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/World/solanum"
license=('GPL3')
depends=('libadwaita' 'gst-plugins-bad-libs')
makedepends=('blueprint-compiler' 'cargo' 'meson' 'git')
checkdepends=('appstream-glib')
_commit=33c01f8a2da39cba0bc1744e405de2be833876cd  # releases/v4.0.0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
}

pkgver() {
  cd $pkgname
  git describe --tags
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
