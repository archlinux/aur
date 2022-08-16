# Maintainer:  Paul van der Linden <mail@paultjuh.org>
pkgname=scangearmp2-sane-git
pkgver=4.40
pkgrel=1
pkgdesc="Canon ScanGear MP v2 scanner utility and sane backend"
arch=('x86_64')
url="https://github.com/Ordissimo/scangearmp2"
license=('GPL' 'custom:canon')
depends=('gtk3')
makedepends=('cmake' 'libjpeg' 'sane' 'intltool' 'git')
provides=('scangearmp2')
conflicts=('scangearmp2')

# install=${pkgname}.install
source=("${pkgname}::git+https://github.com/Ordissimo/scangearmp2")
sha256sums=('SKIP')

_builddir="${pkgname}/build"

build() {
  mkdir -p ${_builddir}
  rm -rf ${_builddir}
  echo "Starting build ..."
  cmake -H"${_builddir}/.." -B${_builddir} -DCMAKE_INSTALL_PREFIX="/"
  make -j4 -C${_builddir}
}

package() {
  rm -rf ${pkgdir}
  make -C${_builddir} install DESTDIR=${pkgdir}

  mkdir -p ${pkgdir}/usr/share/licenses/scangearmp2-sane
  mv ${pkgdir}/usr/share/scangearmp2/doc/* ${pkgdir}/usr/share/licenses/scangearmp2-sane/
  rmdir ${pkgdir}/usr/share/scangearmp2/doc/
}
