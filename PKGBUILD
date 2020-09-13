# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate-git
pkgver=0.0.2.r18.g8976c22
pkgrel=1
pkgdesc="Censor private information"
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+${url}.git")
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
