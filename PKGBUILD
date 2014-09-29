# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.4.3
pkgrel=2
pkgdesc="KDE Config Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx' 'kdebase-runtime' 'fcitx-qt4')
makedepends=('cmake' 'automoc4')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('d311699a5d99f75d353899b7fba0a950491ee8b891724b855033449900ec4b3db9408bb1b80e60ceb0dbb0ce91072162062261a497f83a2a683214b71c3f4713')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  mkdir -p build
  cd build
    
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DFCITX_PO_INSTALL_DIR=share/locale/kde4/ ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
