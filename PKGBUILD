# Maintainer; Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kpar2
pkgver=0.4.5
pkgrel=6
pkgdesc="PAR2 verification and repair program for KDE4"
arch=('i686' 'x86_64')
url="http://code.google.com/p/kpar2kde4/"
license=('GPL3')
depends=('kdebase-runtime' 'libpar2')
makedepends=('cmake' 'automoc4')
source=("http://kpar2kde4.googlecode.com/files/kpar2-${pkgver}.tar.gz"
        'kpar2.desktop.diff')
sha1sums=('e4dfbb55459452a17b0263bf3742acdb0e39d613'
          '0f3584e7fdc661f38ac36c6eeb4f249be4712c4a')
install=kpar2.install

prepare() {
  mkdir -p build
  patch -d "kpar2-${pkgver}" -p0 -i kpar2.desktop.diff
}

build() {
  cd build
  cmake "../kpar2-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
