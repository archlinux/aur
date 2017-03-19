# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

_pkgname=recipes
pkgname=$_pkgname-git
pkgver=7b6ce20
pkgrel=1
pkgdesc="A GNOME recipes cooking book"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'gnome-autoar' 'gspell' 'libcanberra')
makedepends=('intltool' 'gnome-doc-utils' 'git' 'meson')
groups=('gnome')
url="https://git.gnome.org/browse/recipes/"
replaces=('recipes')
provides=('recipes')
conflicts=('recipes')
source=("git://git.gnome.org/${_pkgname}"
)
sha256sums=('SKIP')

pkgver() {
  git describe --always | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
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
