# Mainttainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: tristanrw <hidden>
# Contributor: bash000000 <hidden>
# Contributor: Blutkoete <tobias dot borgert @ gmail dot com>
# Contributor: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf at gmail dot com>

pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=('libsoup3' 'json-glib' 'qt6-declarative' 'glib2-devel' 'qt6-base')
pkgver=1.67.9f327d1
_hash=9f327d194b7bc143c0ea2ace20246cf4d20a9bc4
pkgrel=3
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'meson' 'qt6-tools' 'vala' 'gi-docgen')
source=(snapd-glib-${pkgver}.tar.xz::"https://github.com/canonical/snapd-glib/archive/$_hash.tar.gz")
sha256sums=('13893f986275bf5728380bc1bf085d7065f5fb2215f4ea8f9ab552814cfd4c9c')

build() {
  cd "snapd-glib-$_hash"
  meson setup -Dprefix=/usr -Dbuildtype=release -Ddebug=false -Doptimization=3 -Dqt6=true build
  ninja -C build
}

package() {
  cd "snapd-glib-$_hash"
  DESTDIR="$pkgdir" meson install -C build
}
