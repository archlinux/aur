# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=solanum
pkgver=v1.1.0.r0.g9804c7b
pkgrel=1
pkgdesc="A pomodoro timer for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/World/solanum"
license=('GPL3')
depends=('gst-plugins-bad-libs' 'libhandy')
makedepends=('rust' 'meson' 'git')
checkdepends=('appstream-glib')
_commit=9804c7bab1de46fb14bdd24784cecfa09c0fff5b
source=("git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
