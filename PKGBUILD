# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=wxmaxima-git
pkgver=22.05.0.r177.g05251f684
pkgrel=1
pkgdesc="A document based interface for the computer algebra system Maxima."
arch=('i686' 'x86_64')
url="https://wxmaxima-developers.github.io/wxmaxima/"
license=('GPL2')
depends=('maxima' 'wxwidgets-common' 'openmp')
makedepends=('git' 'texi2html' 'cmake')
optdepends=('gnuplot: for plotting'
'bash-completion: for completion when using bash'
  'man-db: manual pages for wxMaxima')
conflicts=('wxmaxima')
provides=('wxmaxima')
source=("git+https://github.com/wxMaxima-developers/wxmaxima.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags --long | cut -c9- | sed 's+-+.r+' |tr - .
}

build() {
  cd ${pkgname%-git}
  [ -d build ] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DWXM_INCLUDE_FONTS=OFF ..
  cmake --build .
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir" install
}
