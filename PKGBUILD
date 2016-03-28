# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ramon Buldó <ramon@manjaro.org>

pkgname=maia-gtk-theme
pkgdesc="Maia GTK theme"
_pkgname=artwork-maia-gtk
pkgrel=1
_gitcommit=f4ea22a4fb0b0da038c0d256ebf1205f3e9b69e0
pkgver=$(echo ${_gitcommit} | cut -c1-7)
url="https://github.com/manjaro/$_pkgname/"
arch=('any')
license=('LGPL')
depends=('bash')
makedepends=('extra-cmake-modules')
source=("$url/archive/$_gitcommit.tar.gz")
sha256sums=('477dff460dfb0837048c80ac0543bcfc9c4ab5303180b4986e3252a375bd548c')

prepare() {
  mv $srcdir/artwork-maia-gtk-$_gitcommit $srcdir/maia
  mkdir -p build
}

build() {
  cd build
  cmake ../maia \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
