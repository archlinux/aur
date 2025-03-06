# Maintainer: tristanrw <hidden>
# Contributor: bash000000 <hidden>
# Contributor: Blutkoete <tobias dot borgert @ gmail dot com>
# Contributor: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf at gmail dot com>

pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=('libsoup3' 'json-glib' 'qt6-declarative' 'glib2-devel' 'qt6-base')
pkgver=1.66.9af6ed
pkgrel=1
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('gobject-introspection' 'gtk-doc' 'meson' 'qt6-tools' 'vala' 'gi-docgen')
source=(snapd-glib-${pkgver}.tar.xz::"https://github.com/canonical/snapd-glib/archive/9af6ed6d7cce8965e30e4165982cdb21ccb663db.tar.gz" "https://github.com/canonical/snapd-glib/pull/199/commits/d1e9d5d23004456cec1505c4eea668370869086a.patch")
sha256sums=('7a215fd20c3d27067f6e310fcaf222993e30f59f95f94d54fcecb5cd67f35744'
            '95b43d70b99e63e1ff572f8a1342d80f2437befa25ac3f27979451b4141381c6')
prepare(){
	cd $srcdir/snapd-glib-9af6ed6d7cce8965e30e4165982cdb21ccb663db
	git apply ../d1e9d5d23004456cec1505c4eea668370869086a.patch
}
build() {
  cd "snapd-glib-9af6ed6d7cce8965e30e4165982cdb21ccb663db"
  meson setup -Dprefix=/usr -Dbuildtype=release -Ddebug=false -Doptimization=3 -Dqt6=true build
  ninja -C build
}

package() {
  cd "snapd-glib-9af6ed6d7cce8965e30e4165982cdb21ccb663db"
  DESTDIR="$pkgdir" meson install -C build
}
