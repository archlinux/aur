# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=qt2-git
_pkgname=qt2
pkgver=2.3.2.r40.e354dc4
_pkgver=2.3.2
pkgrel=1
pkgdesc="Porting Qt2 to modern cmake to use it for KDE 2 port"
arch=('i686' 'x86_64')
url="https://github.com/heliocastro/qt2"
license=("custom:Qt Free Edition License")
depends=('libxft' 'libsm' 'libgl' 'freeglut' 'libmng' 'libjpeg-turbo' 'libxmu' 'glu')
makedepends=('git' 'cmake' 'byacc')
source=("git+https://github.com/heliocastro/qt2.git")
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
