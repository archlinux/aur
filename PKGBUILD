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
        fcitx-qt5.11.patch::"https://github.com/fcitx/fcitx-qt5/commit/af033e3d.patch")
sha512sums=('902180ff8336c688d5d548a1628dc481f1ce0ea6cc79719ab53337ebfbb745232bfc58cf6e739a60c562d30c3d996eb5e07bd8ef932eade72a79fb35e096e1c3'
            'SKIP'
            'e405f8c63db309e0fe85d9aa031357b0a2d400fb2aafd0b06b278a0e67bf7c24f36a4cbcbb6a3df653ce120858c9f7ca0ebe4a2fb2474f0e42b4b6ad469eaa1f')
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
