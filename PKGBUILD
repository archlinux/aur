# Maintainer: Charlie Wolf <charlie@wolf.is>

pkgname='gdax-desktop-portfolio-monitor-git'
arch=('i686' 'x86_64')
pkgver=r3.64b6340
pkgrel=1
depends=('qt5-base' 'qt5-websockets')
makedepends=('cmake')
pkgver() {
  cd $srcdir/gdax-desktop-portfolio-monitor
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
source=("git+https://gitlab.com/charliewolf/gdax-desktop-portfolio-monitor.git" "gdax-monitor.desktop")
sha256sums=('SKIP' '8ed6f8f8b55f762786866e9c41a300d6d9b2a024c8aa5d3b6c6e30645b472f76')

build(){
  cd $srcdir/gdax-desktop-portfolio-monitor
  mkdir -p build
  pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package(){
  cd $srcdir/gdax-desktop-portfolio-monitor
  pushd build
  make DESTDIR=$pkgdir/ install
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  cp $srcdir/gdax-monitor.desktop $pkgdir/usr/share/applications
  cp $srcdir/gdax-desktop-portfolio-monitor/src/gdax.png $pkgdir/usr/share/pixmaps/gdax.png
}
