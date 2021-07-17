# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate
pkgver=0.0.3.r0.g002558e
pkgrel=2
pkgdesc="Censor private information"
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
_commit=002558e767696471d15a4916c49103b58c4f376b # tags/0.0.3
source=("git+${url}.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd obfuscate
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson obfuscate build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
