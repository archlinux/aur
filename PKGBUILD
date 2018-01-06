# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

_pkgname=recipes
pkgname=$_pkgname-git
pkgver=2.0.2+24+gaa4a7e7
pkgrel=1
pkgdesc="A GNOME recipes cooking book"
arch=(i686 x86_64)
license=(GPL)
depends=(gtk3 gnome-autoar gspell libcanberra)
makedepends=(gnome-doc-utils git meson itstool)
groups=(gnome)
url="https://git.gnome.org/browse/recipes/"
replaces=(recipes)
provides=(recipes)
conflicts=(recipes)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule update
}

build() {
  cd $_pkgname
  [ -d build ] && rm -rf build
  meson build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd $_pkgname
  DESTDIR=${pkgdir} ninja -C build install
}
