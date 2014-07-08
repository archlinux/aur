# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=libnpengine
pkgver=0.3.5
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL3')
pkgdesc='Free implementation of Nitroplus Visual Novel game engine'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpa=$pkgver" 'boost-libs' 'sfml' 'gst-plugins-base-libs' 'ttf-arphic-uming')
makedepends=('cmake' 'boost')
source=(libnpengine-$pkgver.tar.gz::"https://github.com/FGRE/libnpengine/archive/v$pkgver.tar.gz")
sha256sums=('9b7e049c6cb78140e9d91a18231afa6197b9412fcf9e45cdf3cb4ec4f12a2b8c')

prepare() {
  # patch font path
  sed 's|cjkuni-uming|TTF|' -i $pkgname-$pkgver/src/nsbinterpreter.cpp
}

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
