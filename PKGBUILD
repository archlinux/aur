# $Id$
# Maintainer: Simone Gaiarin <simgunz@gmail.com>
# Contributor: Simone Gaiarin <simgunz@gmail.com>

pkgname=kdeedu-ktouch-patched
pkgver=16.08.0
pkgrel=1
pkgdesc="Touch Typing Tutor - Patched to fix bugs #350336, #346248 and #367891, #364011 (disable layout autodetect)"
url="http://kde.org/applications/education/ktouch/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdeedu')
depends=('kdebase-runtime' 'kqtquickcharts' 'libxkbfile')
makedepends=('cmake' 'automoc4' 'mesa')
conflicts=('kdeedu-ktouch')
source=("http://download.kde.org/stable/applications/${pkgver}/src/ktouch-${pkgver}.tar.xz"
        'fix-lag.patch::https://bugsfiles.kde.org/attachment.cgi?id=93186'
        'nox11.patch')
sha1sums=('af8c32c33c9e3a5cf017d76497e94514a40d4f65'
          'd066e0ee7d0dc95c63afe9469bf6a0a975bf18d2'
          'ace197b951d64afa71c3bd8d815e5d1f970a44bc')

prepare() {
  mkdir -p build
  cd ktouch-${pkgver}
  patch -p1 -i ../fix-lag.patch
  patch -p0 -i ../nox11.patch
}

build() {
  cd build
  cmake ../ktouch-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
