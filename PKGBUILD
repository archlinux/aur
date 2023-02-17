# Maintainer: AI5C <ai5c@ai5c.com>

pkgname=valentina
pkgver=0.7.52
pkgrel=2
pkgdesc="Open source patternmaking software"
arch=('x86_64')
url="https://smart-pattern.com.ua/en/"
license=('GPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'desktop-file-utils')
source=("https://github.com/dismine/valentina/archive/refs/tags/v$pkgver.tar.gz")
conflicts=("$pkgname-appimage")

sha512sums=('5f1f1ea46a3085aa4f6e5e9266f1bcc5696c07118b31679cb7e29c9a287e93b8c73e084dedf30593cc124217075113a68bf443b107009b795a449956a96e90d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [ ! -e build ] && mkdir build
  cd build
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib ../Valentina.pro -r CONFIG+=noDebugSymbols CONFIG+=no_ccache CONFIG+=noTests CONFIG+=noRunPath
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  INSTALL_ROOT="$pkgdir/" make install
}
