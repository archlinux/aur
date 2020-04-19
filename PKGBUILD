# Maintainer: Philip Goto <philip.goto@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=shortwave-git
pkgver=1.0.1.r21.gf38f79b
pkgrel=1
pkgdesc="Find and listen to internet radio stations"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('gst-plugins-bad'
         'libhandy')
makedepends=('appstream-glib'
             'git'
             'gobject-introspection'
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
