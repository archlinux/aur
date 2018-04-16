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
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/kpar2kde4/kpar2-${pkgver}.tar.gz"
        'kpar2.desktop.diff'
        )
sha256sums=('91c4d12600e9d9346e37ac2bec98cf6331e9491d510aeda1e12b0c15e3f1324e'
            '48d28e11b739b111f7a3731be8e4973774f561e346104cb28f595eb530dfd31d'
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
