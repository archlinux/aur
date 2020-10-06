# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-tour-git
pkgver=3.38.0.r13.gde28ab3
pkgrel=1
pkgdesc="A guided tour and greeter for GNOME"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/${pkgname%-git}"
license=('GPL')
depends=('libhandy')
makedepends=('rust' 'meson' 'git')
checkdepends=('appstream-glib')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
