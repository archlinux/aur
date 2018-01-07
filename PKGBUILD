# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=q4wine
pkgver=1.3.6
pkgrel=1
pkgdesc="A Qt4 GUI for Wine"
arch=("x86_64")
url="http://sourceforge.net/projects/${pkgname}/"
license=("GPL3")
depends=("qt5-base" "wine" "sqlite3" "which" "icoutils")
makedepends=("cmake" "qt5-tools")
optdepends=("winetricks" "fuseiso")
options=('!emptydirs')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver/_/-}.tar.bz2)
sha256sums=('f8127ca54880e1dbf804e1ef852d868c3f3e4c596d6e7db88093d584cc54996a')

build() {
  cd "$srcdir"/${pkgname}-${pkgver/_/-}
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_WINETRIKS=ON \
    -DLIBS_ENTRY_PATH=/usr/lib/$pkgname \
    -DQT5=ON \
    .
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver/_/-}
  make DESTDIR="$pkgdir" install
}
