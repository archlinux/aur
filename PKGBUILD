# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxirc-qt
pkgver=1.40.1
pkgrel=1
pkgdesc="A simple IRC client with Qt GUI only"
arch=('i686' 'x86_64')
url="https://dxirc.org"
license=("GPL")
depends=('qt5-base' 'qt5-multimedia' 'lua' 'openssl')
makedepends=('cmake' 'ninja')
conflicts=('dxirc' 'dxirc-fox')
source=(http://downloads.sourceforge.net/sourceforge/dxirc/dxirc-$pkgver.tar.gz)
md5sums=('e5b46ffcc913de2cfa63721768c5a102')

build() {
  cmake -S dxirc-$pkgver -B build -G Ninja -DBUILD_FOX=FALSE -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir/usr/share/applications/dxirc-fox.desktop"
}
