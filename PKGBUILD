# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname='fatrat'
pkgname="$_pkgname-git"
pkgver=1.2.0_beta2.38.gd215e77
pkgrel=1
pkgdesc='Qt Download/Upload Manager'
arch=('i686' 'x86_64')
url='http://fatrat.dolezel.info'
license=('custom: GPL2 + complement')
depends=('curl' 'libtorrent-rasterbar<=1:1.0.9' "qt5-"{tools,svg,webengine})
optdepends=('desktop-file-utils: add application to MIME database')
makedepends=('git' 'cmake' 'boost')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/LubosD/fatrat.git")
sha256sums=("SKIP")

pkgver() {

  cd "$_pkgname"
  git describe --always | sed 's/-/./g'

}

build() {

  cd "$_pkgname"
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_DOCUMENTATION=ON \
        -DWITH_NLS=ON \
        -DWITH_CURL=ON \
        -DWITH_BITTORRENT=ON
  make

}

package() {

  # actual installation
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install

  # license
  install -D -m644 $srcdir/$_pkgname/LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
