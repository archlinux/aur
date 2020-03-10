pkgname=gnome-video-effects-git
_pkgname=gnome-video-effects
pkgver=0.5.0+7+g98cd0b2
pkgrel=1
pkgdesc="Collection of GStreamer effects for GNOME"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gnome-video-effects"
license=(GPL2)
depends=('gst-plugins-good' 'gst-plugins-bad' 'frei0r-plugins')
makedepends=('meson' 'git')
provides=('gnome-video-effects')
conflicts=('gnome-video-effects')
source=("git+https://gitlab.gnome.org/GNOME/gnome-video-effects.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
