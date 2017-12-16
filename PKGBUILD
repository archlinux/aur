# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ramon Buldó <ramon@manjaro.org>

pkgname=maia-gtk-theme
pkgdesc="Maia GTK theme"
_pkgname=artwork-maia-gtk
pkgrel=1
_gitcommit=416ff43e8e442e3e859e618eeb8162068d415f1e
pkgver=$(echo ${_gitcommit} | cut -c1-7)
url="https://github.com/manjaro/$_pkgname/"
arch=('any')
license=('LGPL')
depends=('bash')
makedepends=('qt5-base' 'extra-cmake-modules')
source=("$url/archive/$_gitcommit.tar.gz")
sha256sums=('3de5e77c07b8c41ef1ddd41431b114e9c6a1dad269699b5bfc914129986498b6')

prepare() {
  mv $srcdir/artwork-maia-gtk-$_gitcommit $srcdir/${_pkgname}
  mkdir -p $srcdir/${_pkgname}/build
}

build() {
  cd $srcdir/${_pkgname}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $srcdir/${_pkgname}/build
  make DESTDIR="${pkgdir}" install
}
