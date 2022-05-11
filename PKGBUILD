# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainabout-git
pkgver=0.1.3.r4.g47be0fe
pkgrel=1
pkgdesc="plainDE about screen"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://plainde.org"
license=(GPL3)
depends=(qt6-base noto-fonts-emoji polkit ttf-opensans make)
makedepends=(git)
source=("git+https://github.com/plainDE/plainAbout.git")
sha256sums=('SKIP')
conflicts=('plainabout')

pkgver() {
  cd $srcdir/plainAbout
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/plainAbout
  echo "QString version(){return \"$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')\";}" > version.cpp
  qmake6
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/plainAbout/plainAbout $pkgdir/usr/bin/
}

