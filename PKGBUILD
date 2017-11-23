# $Id: PKGBUILD 208988 2017-01-25 08:21:35Z arojas $
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Mateusz Herych
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=kadu
pkgver=4.3
pkgrel=1
pkgdesc='Qt-based Jabber/XMPP and Gadu-Gadu client'
arch=('i686' 'x86_64')
url='http://www.kadu.net/'
license=('GPL')
depends=('libgadu' 'libxss' 'enchant' 'libmpdclient' 'libotr' 'libarchive' 'injeqt' 'xdg-utils' 'qt5-multimedia'
         'qt5-x11extras' 'qt5-svg' 'qt5-script' 'qt5-webkit' 'hicolor-icon-theme')
makedepends=('cmake' 'libao' 'libsndfile' 'libxtst' 'curl' 'qt5-tools' 'qxmpp')
optdepends=('qxmpp: Jabber protocol')
source=(http://download.kadu.im/stable/$pkgname-$pkgver.tar.bz2)
md5sums=('011899121ca5a7e653892f29072032e2')

prepare() {
  sed -i 's/unity_integration//g' $pkgname-$pkgver/Plugins.cmake
  sed -i 's/indicator_docking//g' $pkgname-$pkgver/Plugins.cmake
}

build() {
  mkdir build
  cd build

  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_STANDARD=14 \
    -DENABLE_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" LIBDIR=/usr/lib install
}
