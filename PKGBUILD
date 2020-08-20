# Maintainer: Ford Smith <lonelyrustacean@gmail.com>

pkgname="deepin-screen-recorder-copy-patch"
pkgver=5.8.0.11
pkgrel=3
pkgdesc="Easy-to-use screen recording tool for linuxdeepin desktop environment with xclip copy patch"
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-screen-recorder"
provides=('deepin-screen-recorder')
conflicts=('deepin-screen-recorder' 'deepin-screenshot-copy-patch')
license=('GPL3')
depends=('deepin-qt5integration' 'dtkwm' 'deepin-turbo')
makedepends=('cmake' 'qt5-tools')
groups=('deepin-extra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/deepin-screen-recorder/archive/$pkgver.tar.gz"
         deepin-screen-recorder-qt5.15.patch
	 deepin-screen-recorder-copy.patch )
sha512sums=('8fb57603905d46efa52fb347a9b9e0101b55ff747ea8beed7cd248be9f488927f3a809bb112e98fddd16bb574386dba5706f71f181a19615cd2f1bf4e769d28e'
            'aaef789b5b1e74c9b2972bf94134b639393247ea4c6459e90d0b875d692b6adca71cafc27f1cc402fc81126eb47c52ae816867d7a3d2dfa775594dd839840247'
            '1dd96cf8fcdb4aae97e082619844d135181ee76490b8be54c5eff821ed544499d38381e6f88ca88a5b16b9ce30d9d69aaaf13d98e7d1f6c64f90bc9ae566868d')

prepare() {
  cd deepin-screen-recorder-$pkgver
  sed -i '/include <X11.extensions.XTest.h>/a #undef min' src/event_monitor.cpp
  patch -p1 -i ../deepin-screen-recorder-qt5.15.patch # Fix build with Qt 5.15
  patch -p1 -i ../deepin-screen-recorder-copy.patch
}

build(){
  cd deepin-screen-recorder-$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd deepin-screen-recorder-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
