# $Id: PKGBUILD 280288 2016-11-10 18:13:29Z arojas $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdemultimedia-audiocd-kio
pkgver=16.08.3
pkgrel=2
pkgdesc="Kioslave for accessing audio CDs"
url='https://www.kde.org/applications/multimedia/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libkcddb4' 'libkcompactdisc4' 'lame')
makedepends=('cmake' 'automoc4')
groups=('kde-applications' 'kdemultimedia')
replaces=('kdemultimedia-kioslave')
conflicts=('kdemultimedia-kioslave')
source=("http://download.kde.org/stable/applications/${pkgver}/src/audiocd-kio-${pkgver}.tar.xz")
sha1sums=('f707954fe5cea016aa6ac43c3ff5aedf72c29529')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../audiocd-kio-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
