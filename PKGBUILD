# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium
pkgver=15.06.03
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('python' 'qt5-quickcontrols' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'arcus')
makedepends=('cmake')
source=("https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz" qt5.patch)
md5sums=('60c583b462494c2de015a678ba134eb3'
         'e4975dddd0524845b9574b4142274f5a')

prepare(){
  cd Uranium-${pkgver}
  patch -Np1 -i ../qt5.patch
}

build() {
  cd Uranium-${pkgver}
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd Uranium-${pkgver}
  make DESTDIR="${pkgdir}" install
  SITE_PACKAGES=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  mkdir -p "${pkgdir}${SITE_PACKAGES}"
  mv "${pkgdir}"/usr/lib/python3/dist-packages/* "${pkgdir}${SITE_PACKAGES}"/.
  rm -rf "${pkgdir}"/usr/lib/python3
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
