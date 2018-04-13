# Maintainer; Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kpar2
pkgver=0.4.5
pkgrel=7
pkgdesc="PAR2 verification and repair program for KDE4"
arch=('x86_64')
url='http://code.google.com/p/kpar2kde4'
license=('GPL3')
depends=('kdebase-runtime'
         'libpar2'
         )
makedepends=('cmake'
             'automoc4'
             )
source=("http://kpar2kde4.googlecode.com/files/kpar2-${pkgver}.tar.gz"
        'kpar2.desktop.diff'
        )
sha256sums=('e4dfbb55459452a17b0263bf3742acdb0e39d613'
          '0f3584e7fdc661f38ac36c6eeb4f249be4712c4a'
          )

prepare() {
  mkdir -p build

  patch -d "kpar2-${pkgver}" -p0 -i "${srcdir}/kpar2.desktop.diff"

  cd build
  cmake ../"kpar2-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
