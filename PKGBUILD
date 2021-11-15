# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/gabmus/hydrapaper

pkgname=hydrapaper-git
pkgver=3.2.0.r0.gab5a473
pkgrel=1
pkgdesc="Wallpaper manager with multi monitor support"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL3')
depends=('gtk4' 'libadwaita>=1.0.0.alpha.4' 'dbus-python' 'python-gobject' 'python-pillow')
makedepends=('git' 'gobject-introspection' 'meson' 'pandoc')
checkdepends=('appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.gnome.org/GabMus/HydraPaper.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

