# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=solanum
pkgver=3.0.1.r0.g3f84b1d
pkgrel=1
pkgdesc="A pomodoro timer for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/World/solanum"
license=('GPL3')
depends=('libadwaita' 'gst-plugins-bad-libs')
makedepends=('rust' 'meson' 'git')
checkdepends=('appstream-glib')
_commit=3f84b1d0c46fe1a3daef2940b1d0747222023984  # tags/v3.0.1
source=("git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^v//;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
