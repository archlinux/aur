# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=solanum
pkgver=v2.1.0.r0.g3e69272
pkgrel=1
pkgdesc="A pomodoro timer for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/World/solanum"
license=('GPL3')
depends=('libadwaita' 'gst-plugins-bad-libs')
makedepends=('rust' 'meson' 'git')
checkdepends=('appstream-glib')
_commit=3e69272fb31bf18a7aa74ece9d904d445c458274  # tags/v2.1.0
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
