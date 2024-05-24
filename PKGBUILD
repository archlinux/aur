pkgname=pulsecontrol-git
pkgver=0.9
pkgrel=1
pkgdesc="A fork of pavucontrol aiming at better UX"
url="https://gitlab.freedesktop.org/oxayotl/pavucontrol/-/tree/fork"
arch=(x86_64)
license=(GPL)
depends=(
  gtkmm-4.0
  json-glib
  libcanberra
  libadwaita
)
makedepends=(
  git
  meson
)
checkdepends=(tidy)
optdepends=("pulseaudio: Audio backend")
source=("git+https://gitlab.freedesktop.org/oxayotl/pavucontrol.git#branch=fork")
b2sums=('SKIP')

pkgver() {
  cd pavucontrol
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd pavucontrol
}

build() {
  arch-meson pavucontrol build -Dlynx=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
