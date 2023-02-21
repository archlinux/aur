# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate-git
pkgver=0.0.7.r30.g73493b2
pkgrel=1
pkgdesc="Censor private information"
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'cargo')
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
  meson install -C build --destdir="$pkgdir"
}
