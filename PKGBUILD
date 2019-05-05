# Maintainer: Ramon Buldó <ramon@manjaro.org>
# Contributor: Sergey Starovoytov <sergey.starovoytov.94@gmail.com>

pkgname=breath-gtk-theme
pkgdesc="Breath GTK theme (from Manjaro)"
_pkgname=artwork-breath-gtk
pkgrel=1
_gitcommit=da2706640f457f89de6c26312e391b244ff550b4
pkgver=$(echo ${_gitcommit} | cut -c1-7)
url="https://github.com/manjaro/$_pkgname"
arch=('any')
license=('LGPL')
depends=('bash')
makedepends=('qt5-base' 'extra-cmake-modules')
source=("$url/archive/$_gitcommit.tar.gz")
sha256sums=('c1ea830c7add04ff76b280a888b68d972133c0cfbde3f96543c779c3b7ae669d')

prepare() {
  mv $srcdir/artwork-breath-gtk-$_gitcommit $srcdir/${_pkgname}
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
