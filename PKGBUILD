pkgname=gnome-sound-recorder-git
_pkgname=gnome-sound-recorder
pkgver=3.34.0+216+g6411a90
pkgrel=1
pkgdesc="A utility to make simple audio recording from your GNOME desktop"
url="https://wiki.gnome.org/Apps/SoundRecorder"
arch=(any)
license=(GPL2)
depends=('gtk3' 'gjs' 'gst-plugins-good' 'gst-plugins-base' 'libhandy')
makedepends=('gobject-introspection' 'git' 'meson')
provides=('gnome-sound-recorder')
conflicts=('gnome-sound-recorder')
source=("git+https://gitlab.gnome.org/GNOME/gnome-sound-recorder.git")
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
