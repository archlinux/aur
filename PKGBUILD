# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archinux.org>

pkgname=snorenotify
pkgver=0.6.0
pkgrel=1
pkgdesc='Multi-platform Qt5 notification framework'
arch=('i686' 'x86_64')
url='https://github.com/Snorenotify/Snorenotify'
license=('LGPL3')
depends=('qt5-base' 'qt5-quick1' 'hicolor-icon-theme')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/Snorenotify/Snorenotify/archive/v$pkgver.tar.gz)
md5sums=('fc2074ffd9d639e966ff8c01543ece8e')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  cmake -DWITH_QT4=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
  
  install -d "${pkgdir}"/usr/lib/qt
  mv "${pkgdir}"/usr/mkspecs "${pkgdir}"/usr/lib/qt
}
