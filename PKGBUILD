# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=drawpile
pkgver=1.0.0
pkgrel=2
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('x86_64' 'i686')
url='http://drawpile.net/'
license=('GPL2')
depends=('karchive' 'kdnssd' 'giflib' 'miniupnpc' 'libmicrohttpd' 'qt5-multimedia' 'qt5-color-picker')
makedepends=('qt5-base' 'qt5-tools' 'qt5-translations' 'qt5-svg' 'ninja' 'cmake')
install="${pkgname}.install"
source=("http://drawpile.net/files/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bc574ddbad1578e84ca36605c338400239d4f106750e253ca7cf027c0b42c454')

build() {
  cd "${pkgname}-${pkgver}"

  # Ensure build is an empty directory
  rm -rf build
  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -G Ninja -Wno-dev
  ninja
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "desktop/$pkgname-128x128.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "desktop/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
