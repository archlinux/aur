# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-tweaks-git
pkgver=3.34.0.r21.g39cde84
pkgrel=1
pkgdesc="Graphical interface for advanced GNOME 3 settings (Tweak Tool)"
url="https://wiki.gnome.org/Apps/Tweaks"
arch=(any)
license=(GPL)
depends=(gnome-settings-daemon python-gobject libhandy)
makedepends=(git meson)
groups=(gnome-extra)
provides=(gnome-tweaks)
conflicts=(gnome-tweaks)
source=("git+https://gitlab.gnome.org/GNOME/gnome-tweaks.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-tweaks
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-tweaks build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
