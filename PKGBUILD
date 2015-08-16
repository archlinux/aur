# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: XazZ <xazz.xazz at googlemail dot com>

pkgname=liblastfm-qt5
_pkgname=liblastfm
pkgver=1.0.9
pkgrel=1
pkgdesc="A Qt5 C++ library for the Last.fm webservices"
arch=('i686' 'x86_64')
url='https://github.com/lastfm/liblastfm/'
license=('GPL3')
depends=('qt5-base' 'fftw' 'libsamplerate')
makedepends=('cmake')
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/lastfm/${_pkgname}/tarball/${pkgver}")
sha1sums=('cd8c6f160529dbf9e0566973a8f37130c83a78c0')

prepare() {
  rm -rf "build"
  mkdir "build"
}

build() {
  cd "build"
  cmake ../lastfm-${_pkgname}-* \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_WITH_QT4=OFF \
    -DBUILD_TESTS=OFF
  make
}

package(){
  cd "build"
  make DESTDIR="${pkgdir}" install
  # liblastfm-qt compability
  mv "${pkgdir}/usr/include/lastfm"{,5}
}
