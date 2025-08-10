# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=qgpgme-qt5
_pkgbase=gpgme
pkgver=2.0.0
pkgrel=3
pkgdesc="Qt5 bindings for GPGme"
arch=('x86_64')
url='https://gnupg.org/software/gpgme/index.html'
license=(GPL-2.0-or-later)
makedepends=(cmake
             git)
depends=(gcc-libs
         glibc
         gpgmepp
         qt5-base)
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)
source=(git+https://dev.gnupg.org/source/gpgmeqt#tag=gpgmeqt-$pkgver)
sha256sums=('d48db1e5c6cb36eeff4379169a9a7558da8e134a5ce6b88409ecbc70e3183afc')

build() {
  cmake -B build -S gpgmeqt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT5=ON \
    -DBUILD_WITH_QT6=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  mv "${pkgdir}"/usr/lib/cmake/QGpgme "${pkgdir}"/usr/lib/cmake/QGpgmeQt5
  mv "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeConfig.cmake "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeQt5Config.cmake
  mv "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeConfigVersion.cmake "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeQt5ConfigVersion.cmake
}
