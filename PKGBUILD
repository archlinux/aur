_pkgname=retro-gtk
pkgname=$_pkgname-git
pkgver=0.18.1+124+g577091b
pkgrel=1
pkgdesc='Toolkit to write GTK+ 3 based Libretro frontends'
arch=('x86_64')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
depends=('gtk3' 'libpulse')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
provides=('retro-gtk')
conflicts=('retro-gtk')
source=("git+https://gitlab.gnome.org/GNOME/retro-gtk.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  meson --prefix /usr --buildtype=plain $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
