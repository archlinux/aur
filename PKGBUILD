#Maintainer: junglerobba <tobias.langendorf@gmail.com>
#Contributor: Lubosz <lubosz@gmail.com>
#Contributor: helq <linuxero789@gmail.com>


pkgname=gsettings-desktop-schemas-dev
_realpkgname=gsettings-desktop-schemas
pkgver=3.31.0.1
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(i686 x86_64)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
license=('GPL')
depends=(glib2 intltool)
makedepends=(git meson gobject-introspection)

provides=("${_realpkgname}")
conflicts=("${_realpkgname}")

source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git#tag=${pkgver}"
        "12.patch")
sha256sums=('SKIP'
            'fefcf993c0908ab53bcb4ad1cf4f46b8bd99c71d588c6117b1f16993d2250424')

prepare() {
  cd ${_realpkgname}

  #https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/merge_requests/12
  git apply -3 ../12.patch
}

build() {
  arch-meson gsettings-desktop-schemas build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
