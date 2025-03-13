# Maintainer: tristanrw <hidden>
# Contributor: bash000000 <hidden>
# Contributor: Blutkoete <tobias dot borgert @ gmail dot com>
# Contributor: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf at gmail dot com>

pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=('libsoup3' 'json-glib' 'qt6-declarative' 'glib2-devel' 'qt6-base')
pkgver=1.66.9af6ed
pkgrel=2
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'meson' 'qt6-tools' 'vala' 'gi-docgen')
source=(snapd-glib-${pkgver}.tar.xz::"https://github.com/canonical/snapd-glib/archive/9af6ed6d7cce8965e30e4165982cdb21ccb663db.tar.gz" 
		"https://github.com/canonical/snapd-glib/commit/8aeca34f583174357595f72936bc0960f3c9a2f6.patch")
sha256sums=('7a215fd20c3d27067f6e310fcaf222993e30f59f95f94d54fcecb5cd67f35744'
            '682c83fa6e2b3f5f9ad41810fd9277007e40e5347a222a179bfc0242ae6758a3')
prepare(){
	cd $srcdir/snapd-glib-9af6ed6d7cce8965e30e4165982cdb21ccb663db
	git apply ../8aeca34f583174357595f72936bc0960f3c9a2f6.patch
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
