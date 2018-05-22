# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.2.2
pkgrel=3
pkgdesc="Qt5 IM Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base')
makedepends=('extra-cmake-modules')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig}
        fcitx-qt5.11.patch)
sha512sums=('902180ff8336c688d5d548a1628dc481f1ce0ea6cc79719ab53337ebfbb745232bfc58cf6e739a60c562d30c3d996eb5e07bd8ef932eade72a79fb35e096e1c3'
            'SKIP'
            '1931de220c5ba10c794148155a6aa7d6503f080b9ca82e9d7a7db09bb326235816ecec1c76725780901fa7652a99d8e2d1e1e810b2db7f04930c74114198b320')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../fcitx-qt5.11.patch # Fix build with Qt 5.11
}

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
