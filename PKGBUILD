# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=trojita-git
pkgver=0.7.r439.g10033f1b
pkgrel=1
pkgdesc="A fast QT IMAP e-mail client"
arch=(i686 x86_64)
url="http://trojita.flaska.net"
license=('GPL')
depends=('qt5-webkit' 'qtkeychain' 'qt5-tools' 'qt5-svg' 'mimetic'
'qgpgme' 'desktop-file-utils' 'sonnet' 'ragel')
conflicts=('trojita')
provides=('trojita')
makedepends=('git' 'cmake' 'boost')

source=('git+https://invent.kde.org/pim/trojita.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trojita"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/trojita"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_QT5=ON \
        -DWITH_QTKEYCHAIN_PLUGIN=ON \
        -DWITH_GPGMEPP=ON \
        -DWITH_CRYPTO_MESSAGES=ON \
        .
  make
}

package() {
  cd "$srcdir/trojita"
  make install DESTDIR="$pkgdir"
}
