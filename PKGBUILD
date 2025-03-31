# Maintainer:
# Contributor: ItsZariep <ItsZariep@disroot.org>

pkgname=libayatana-appindicator-glib-git
realname=libayatana-appindicator-glib
pkgver=r2144.66f8279
pkgrel=1
pkgdesc='Ayatana Application Indicators shared library (GLib-2.0 reimplementation)'
arch=(x86_64)
url='https://github.com/AyatanaIndicators/libayatana-appindicator-glib'
license=(GPL-3.0)
depends=(gcc-libs
         glib2)
makedepends=(cmake
             git
             gi-docgen
             cmake-extras
             gobject-introspection
             vala)
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/$realname"
echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cmake -B build -S $realname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BINDINGS_MONO=OFF \
    -DENABLE_GTKDOC=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
