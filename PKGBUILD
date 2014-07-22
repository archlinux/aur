# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnpengine
pkgver=0.4.0
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL3')
pkgdesc='Free implementation of Nitroplus Visual Novel game engine'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpa=$pkgver" 'boost-libs' 'sfml' 'gst-plugins-base-libs' 'ttf-arphic-uming')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('299136dbb8dcda89ca7368ecc655112a0b771f3f0162dec85068745f58ba23d3')

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
