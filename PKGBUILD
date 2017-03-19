# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

_pkgname=recipes
pkgname=$_pkgname-git
pkgver=1.0.0+34+g073db09
pkgrel=1
pkgdesc="A GNOME recipes cooking book"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'gtk3' 'gnome-autoar' 'gspell')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'git' 'gobject-introspection' 'meson')
options=('!libtool' '!emptydirs')
groups=('gnome')
url="https://git.gnome.org/browse/recipes/"
replaces=('recipes')
provides=('recipes')
conflicts=('recipes')
source=("git://git.gnome.org/${_pkgname}"
	"git://git.gnome.org/libgd"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|+|g'
}

build() {
  cd "$srcdir/$_pkgname"
  [ -d build ] && rm -rf build
  meson build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR=${pkgdir} ninja -C build install
}
