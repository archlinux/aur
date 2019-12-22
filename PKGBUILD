# Maintainer: Philip Goto <philip.goto@gmail.com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=shortwave-git
pkgver=0.0.1.r6.g5edb0bc
pkgrel=1
pkgdesc="Find and listen to internet radio stations"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('gstreamer'
         'libhandy')
makedepends=('appstream-glib'
             'git'
             'gobject-introspection'
             'gst-plugins-base-libs'
             'libdazzle'
             'meson'
             'rust'
             'xorgproto')
provides=('shortwave')
conflicts=('shortwave')
source=('git+https://gitlab.gnome.org/World/Shortwave.git')
sha256sums=('SKIP')

pkgver() {
  cd Shortwave
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson Shortwave build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
