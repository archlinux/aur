# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=crazydiskinfo
pkgver=1.1.0
pkgrel=2
pkgdesc="An interactive TUI S.M.A.R.T viewer"
arch=('x86_64')
url='https://github.com/otakuto/crazydiskinfo'
license=(MIT)
depends=('libatasmart')
makedepends=('cmake')
source=("https://github.com/otakuto/crazydiskinfo/archive/${pkgver}.tar.gz")
sha256sums=('fca9a4487bb088d4e12d11b0c3040843a109818e9f757912490a0ca15ad95bb4')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/tinfow/tinfo/g' CMakeLists.txt
  sed -i 's/ncursesw/ncurses/g' CMakeLists.txt
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
