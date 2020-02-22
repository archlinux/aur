# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Omar Pakker <omar.pakker@oracle.com>

_pkgname=retro-gtk
pkgname=$_pkgname-git
pkgver=0.18.1+65+g9d8d7d3
pkgrel=1
pkgdesc='Toolkit to write GTK+ 3 based Libretro frontends'
arch=('x86_64')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
depends=('gtk3' 'libpulse')
makedepends=('gobject-introspection' 'meson' 'vala')
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
