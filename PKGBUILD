# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium
pkgver=2.1.3
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('GPLv3')
depends=('python' 'qt5-quickcontrols' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'arcus')
makedepends=('cmake')
source=("https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('94f92cbac5c7953d3c2c55b40bad86c6')

build() {
  cd Uranium-${pkgver}
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd Uranium-${pkgver}/build
  make DESTDIR="${pkgdir}" install

  SITE_PACKAGES=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  mkdir -p "${pkgdir}$(dirname $SITE_PACKAGES)"
  mv "${pkgdir}/usr/lib/python3/dist-packages" "${pkgdir}${SITE_PACKAGES}"
  rm -rf "${pkgdir}"/usr/lib/python3
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
