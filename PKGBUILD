# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=gst-debugger
pkgname=$_name-git
pkgver=0.90.0.r73.g31e96de
pkgrel=1
pkgdesc="Remote GStreamer Debugger"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/GstDebugger"
license=('GPL')
depends=('gstreamermm' 'gtkmm3' 'graphviz' 'protobuf-c' 'boost-libs')
makedepends=('git' 'meson' 'boost')
provides=($_name)
conflicts=($_name)
source=(git+https://git.gnome.org/browse/$_name)
md5sums=('SKIP')

prepare() {
  mkdir build || true
  cd build
}

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd build
  meson setup --prefix=/usr ../$_name
}

check() {
  cd build
  meson test
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
