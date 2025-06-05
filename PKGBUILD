# Mainttainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: tristanrw <hidden>
# Contributor: bash000000 <hidden>
# Contributor: Blutkoete <tobias dot borgert @ gmail dot com>
# Contributor: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf at gmail dot com>

pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=('libsoup3' 'json-glib' 'qt6-declarative' 'glib2-devel' 'qt6-base')
pkgver=1.70
pkgrel=1
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'meson' 'qt6-tools' 'vala' 'gi-docgen')
source=(snapd-glib-${pkgver}.tar.xz::"https://github.com/canonical/snapd-glib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('022df48e519fe2e80f90eba2043aaa54f829f05c87ec38bc1ba794aec8e3c0a4')
optinos=(!lto)

build() {
  cd "snapd-glib-$pkgver"
  meson setup -Dprefix=/usr -Dbuildtype=release -Ddebug=false -Doptimization=3 -Dqt6=true build
  ninja -C build
}

package() {
  cd "snapd-glib-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
