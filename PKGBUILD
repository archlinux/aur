# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.14.1
pkgrel=3
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt5-serialport' 'qt5-websockets')
makedepends=('qt5-tools' 'cmake' 'qt5-3d' 'qt5-svg')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('3b40437c3845499d901e13fc59e8ad30059c7cf9bb2b1abd89e4d29d0a9415a70a056c1ae8fab2de33eabcfabc58c642670cb65da0a3e1bdafe10721b39460a2')

prepare() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  if ! [ -e build ]; then
    mkdir build
  fi
}

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/build"
  cmake -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt5" ..
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
