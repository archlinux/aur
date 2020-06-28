# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate-git
pkgver=0.0.2.r8.gb71967e
pkgrel=1
pkgdesc="Censor private information."
arch=(x86_64)
url="https://gitlab.gnome.org/World/obfuscate"
license=('MIT')
depends=('gtk3' 'appstream-glib')
makedepends=('git' 'meson' 'rust' 'cmake')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd obfuscate
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson --prefix=/usr --buildtype=plain obfuscate build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
