# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Denis Terskov aka neurosurgeon <terskov.den@gmail.com>

_pkgname=scantailor
pkgname=scantailor-featured-git
pkgver=0.9.11.59.g84e16df
pkgrel=1
pkgdesc="Interactive post-processing tool for scanned pages (featured branch)"
arch=('i686' 'x86_64')
url="https://github.com/scantailor/scantailor"
license="GPL"
depends=('qt4' 'libjpeg' 'zlib' 'libpng' 'libtiff' 'libxrender' 'desktop-file-utils' 'xdg-utils')
makedepends=('git' 'cmake' 'boost')
conflicts=('scantailor')
source=('git://github.com/scantailor/scantailor.git#branch=featured')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --always | sed 's|RELEASE_||;s|[_-]|.|g'
}

build() {
  cd "$_pkgname"
  cmake \
    -DCMAKE_CXX_FLAGS="-DBOOST_NO_MEMBER_TEMPLATE_FRIENDS" \
    -DCMAKE_CXX_FLAGS_DEBUG="-DBOOST_NO_MEMBER_TEMPLATE_FRIENDS" \
    -DCMAKE_CXX_FLAGS_RELEASE="-DBOOST_NO_MEMBER_TEMPLATE_FRIENDS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
