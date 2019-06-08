
pkgname=python-pyqt3d
pkgver=5.12
pkgrel=1
pkgdesc="Set of Python bindings for The Qt Company's Qt3D libraries"
arch=('x86_64')
url="https://www.riverbankcomputing.com/software/pyqt3d"
license=('GPL')
depends=('qt5-3d')
makedepends=('sip')
source=("https://www.riverbankcomputing.com/static/Downloads/PyQt3D/${pkgver}/PyQt3D_gpl-${pkgver}.tar.gz")
sha256sums=('a02069872439589080ce1bf3206dd16e328e6db2d8cb67020ae36a327682098a')

build() {
  cd "$srcdir"/PyQt3D_gpl-$pkgver
  python configure.py --no-sip-files --no-qsci-api --no-stubs
  make
}

package() {
  cd "$srcdir"/PyQt3D_gpl-$pkgver
  mkdir -p "$pkgdir"/usr/lib/python3.7/site-packages/
#   sed -i "10iINSTALL_ROOT = $pkgdir" Qt3D*/Makefile 
  make install INSTALL_ROOT="${pkgdir}" -j1
}
