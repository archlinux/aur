# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=qt2-git
_pkgname=qt2
pkgver=2.3.2.r51.cd8f9ec
_pkgver=2.3.2
pkgrel=1
pkgdesc="Porting Qt2 to modern cmake to use it for KDE 2 port"
arch=('i686' 'x86_64')
url="https://github.com/sandsmark/qt2"
license=('GPL2')
depends=('libxft' 'libsm' 'libgl' 'freeglut' 'libmng' 'libjpeg-turbo' 'libxmu' 'glu')
makedepends=('git' 'cmake' 'byacc')
provides=('qt2')
conflicts=('qt2')
source=("git+https://github.com/sandsmark/qt2.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
