# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>

pkgname=gnome-tuner-git
pkgver=0.1.4.r15.gc0c5398
pkgrel=2
pkgdesc="Tuner is the home for your additional system settings, components, applications, and whatever else you want!"
arch=(x86_64)
url="https://altlinux.space/alt-gnome/tuner"
license=(GPL-3.0-or-later)
depends=(
  libpeas-2
  libgee
  libadwaita
  gobject-introspection
  alt-panelmoded-git
)
makedepends=(
  blueprint-compiler
  glib2-devel
  meson
  vala
)
optdepends=(
  gnome-tuner-tweaks-git
  gnome-tuner-panel-git
)
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  arch-meson ${pkgname%-git} build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
