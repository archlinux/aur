# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Andrea Scarpino <andrea@archlinux.org>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=qjson, repo=utopic

pkgname=lib32-qjson
pkgver=0.8.1
pkgrel=4
pkgdesc="A qt-based library that maps JSON data to QVariant objects (32-bit)"
arch=(x86_64)
license=(GPL)
url="http://qjson.sourceforge.net"
depends=(lib32-qt4)
makedepends=(cmake gcc-multilib)
source=(qjson-${pkgver}.tar.gz::"https://github.com/flavio/qjson/archive/${pkgver}.tar.gz")
md5sums=('4eef13da988edf8f91c260a3e1baeea9')

build() {
  cd "qjson-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib32 \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QTCORE_LIBRARY_RELEASE=/usr/lib32/libQtCore.so

  make
}

package() {
  cd "qjson-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/include/"
}
