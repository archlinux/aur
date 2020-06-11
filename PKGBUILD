# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kirigaya <kirigaya@mkacg.com>

pkgname=deepin-topbar-git
pkgver=0.6.6
pkgrel=3
pkgdesc="This is topbar for Deepin"
arch=('x86_64')
url="https://github.com/kirigayakazushin/deepin-topbar"
license=('GPL')
depends=('deepin-network-utils' 'deepin-qt5integration' 'deepin-qt-dbus-factory' 'libdbusmenu-qt5'
         'procps-ng')
makedepends=('cmake' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kirigayakazushin/deepin-topbar/archive/$pkgver.tar.gz"
		"fix_depends.patch")
sha512sums=('415f6e4eadbe78fe1ab4ef61c5f32f8c945fea56556458a88592da7094aeaf1a03cac2f8ac4a2b0f0d3506368ff3f9f3ae19b5683892f5b995024225f06a65dc'
			'd39fa0f074d75de8765a31543a51fe3945f2ed87fe0a544d69c44c0a896a58510a25ba0379b025ebb020912a054fb96d8155359e0859cfda713cf7de40682edb')


prepare() {
  cd deepin-topbar-$pkgver
  patch -p1 -i ../fix_depends.patch
}

build() {
  cd deepin-topbar-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd deepin-topbar-$pkgver
  make DESTDIR="$pkgdir" install
}
