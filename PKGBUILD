# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=trojita-git
pkgver=0.6.r147.gc5373ed
pkgrel=1
pkgdesc="A fast QT IMAP e-mail client"
arch=(i686 x86_64)
url="http://trojita.flaska.net"
license=('GPL')
depends=('qt5-webkit' 'qtkeychain-qt5' 'qt5-tools' 'mimetic'
'gpgmepp' 'xdg-utils' 'desktop-file-utils')
conflicts=('trojita')
provides=('trojita')
makedepends=('git' 'cmake' 'boost')
install=trojita.install

source=('git+https://github.com/jktjkt/trojita.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trojita"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/trojita"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_TESTS=OFF \
        -DWITH_QT5=ON \
        -DWITH_QTKEYCHAIN_PLUGIN=ON \
        -DWITH_GPGMEPP=ON \
        .
  make
}

package() {
  cd "$srcdir/trojita"
  make install DESTDIR="$pkgdir"
}
