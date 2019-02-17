# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=wxmaxima-git
pkgver=19.02.0r31.gc6f587769
pkgrel=1
pkgdesc="A document based interface for the computer algebra system Maxima."
arch=('i686' 'x86_64')
url="http://andrejv.github.io/wxmaxima/index.html"
license=('GPL2')
depends=('maxima' 'wxgtk')
makedepends=('git' 'texi2html' 'cmake')
conflicts=('wxmaxima')
provides=('wxmaxima')
source=("git+https://github.com/wxMaxima-developers/wxmaxima.git")
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "$srcdir/wxmaxima"
  git describe --tags --long | cut -c9- | sed 's+-+r+' |tr - .
}

build() {
  cd "$srcdir/wxmaxima"
  [ -d build ] || mkdir build
  cd build
  cmake ..
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr --build .
}

package() {
  cd "$srcdir/wxmaxima/build"
  make DESTDIR="$pkgdir" install
}
