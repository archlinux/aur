# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=elisa-git
pkgver=0.2.0.r25.g2f45606
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A simple music player for KDE aiming to provide a nice experience for its users"
url="https://cgit.kde.org/elisa.git/"
license=(GPL3 custom:"Qt Company GPL Exception 1.0")
depends=(qt5-quickcontrols qt5-quickcontrols2
         kcmutils baloo)
makedepends=(git python extra-cmake-modules kdoctools)
provides=(elisa)
conflicts=(elisa)
source=("${pkgname}::git://anongit.kde.org/elisa.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE.GPL3-EXCEPT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL3-EXCEPT"
}
