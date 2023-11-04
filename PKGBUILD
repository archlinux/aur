# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marcel Unbehaun <f.rostze.ux at gmail dot com>

pkgname=boatswain-git
pkgver=0.3.0.r102.g591a163
pkgrel=1
pkgdesc='Control Elgato Stream Deck devices'
arch=(x86_64)
url='https://gitlab.gnome.org/World/boatswain'
license=(GPL3)
depends=(
  hidapi
  libadwaita
  libgusb
  libpeas-2
  libportal-gtk4
  libsecret
)
makedepends=(
  git
  meson
  gobject-introspection
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="${pkgdir}"
}
