# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=fcitx-qt5
pkgname=(fcitx-qt5 fcitx-qt6)
pkgver=1.2.7
pkgrel=13
pkgdesc="Qt5/6 IM Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
makedepends=('extra-cmake-modules' 'fcitx' 'libxkbcommon' 'qt5-base' 'qt6-base')
source=("https://download.fcitx-im.org/$pkgbase/$pkgbase-$pkgver.tar.xz"{,.sig})
sha512sums=('1deb2e6cfccaae06ec3d0f3126d463773d9977cd5616bd15b20a668a5b08ae6d0ccb4212393a2ffdca90c247250cd58735e49e4fdda1941b805c86caf29cfcb3'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgbase-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_QT6=On .
  make
}

package_fcitx-qt5() {
  pkgdesc="Qt5 IM Module for Fcitx"
  depends=('fcitx' 'libxkbcommon' 'qt5-base')

  cd $pkgbase-$pkgver
  make -C po install DESTDIR="$pkgdir"
  make -C qt5 install DESTDIR="$pkgdir"
}

package_fcitx-qt6() {
  pkgdesc="Qt6 IM Module for Fcitx"
  depends=('fcitx' 'libxkbcommon' 'qt6-base')

  cd $pkgbase-$pkgver
  make -C qt6 install DESTDIR="$pkgdir"
}
