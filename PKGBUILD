# Maintainer: shinka <shinnkka1@gmail.com>

pkgname=swayosd-gtk3
_pkgname="${pkgname%-gtk3}"
_reponame=SwayOSD
pkgver=0.1.0
pkgrel=1
pkgdesc="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ErikReider/SwayOSD"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell' 'pulse-native-provider' 'libinput')
makedepends=('git' 'cargo' 'meson' 'ninja' 'sassc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${_reponame}"
  cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_reponame}"
  arch-meson --buildtype=release build
  ninja -C build
}

package() {
  cd "${_reponame}"
  meson install -C build --destdir "$pkgdir"
}
