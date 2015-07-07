# Maintainer: Kostas Karanikolas <lastname[at]gmail[dot]com>
pkgname=fuel
pkgver=1.0.0
pkgrel=3
pkgdesc="A GUI front-end to Fossil SCM"
arch=(i686 x86_64)
url="https://fuel-scm.org/"
license=('GPL2')
depends=('qt5-base>=5.4.0', 'qt5-webkit>=5.4.0' 'fossil')
source=("https://fuel-scm.org/files/releases/${pkgname}-${pkgver}.tar.gz")

sha256sums=('034593d16eba9e30a73d1b40bfd4f1a7f9ba438a04dc07cc7bb2cd2202da40fc') # Generate with 'makepkg -g'

build() {
  cd "${srcdir}"
  [ -d build ] && rm -r build
  mkdir build
  cd build
  qmake-qt5 "${srcdir}/${pkgname}-${pkgver}/fuel.pro"
  make
}

package() {
  cd "${srcdir}/build"
  make INSTALL_ROOT="${pkgdir}" install
}

