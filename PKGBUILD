# Maintainer:  tristanrw <hidden>
# Contributor: Blutkoete <tobias dot borgert @ gmail dot com>
# Contributor: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf at gmail dot com>

pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=('libsoup3' 'json-glib' 'qt6-declarative glib2-devel')
pkgver=1.65
pkgrel=1
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('gobject-introspection' 'gtk-doc' 'meson' 'qt6-tools' 'vala')
source=(https://github.com/snapcore/snapd-glib/releases/download/${pkgver}/snapd-glib-${pkgver}.tar.xz)
sha256sums=('f2e6d0f45ed10065f8d7d65cde27d57ef23c0541663d912acbf85322ae911e61')

build() {
  cd "$pkgbase-$pkgver"
  meson build -Dprefix=/usr
  ninja -C build
}

package() {
  cd "$pkgbase-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
