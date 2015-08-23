pkgname=cal3d-svn
pkgver=579
pkgrel=1
pkgdesc="A skeletal-based 3D character animation library"
arch=(i686 x86_64)
url="https://gna.org/projects/cal3d"
options=(!libtool)
license=('GPL2')
depends=('gcc-libs')
makedepends=('subversion' 'cmake')
conflicts=('cal3d')
provides=('cal3d')
source=(cal3d::svn://svn.gna.org/svn/cal3d/trunk/cal3d)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/cal3d"
  svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}/cal3d"
  cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr
  cd build && make
}

package() {
  cd "${srcdir}/cal3d/"
  install -D -m755 bin/libcal3d.so ${pkgdir}/usr/lib/libcal3d.so

  mkdir -p "${pkgdir}/usr/include/cal3d"
  for file in src/cal3d/*.h; do
    install -m644 ${file} "${pkgdir}/usr/include/cal3d/"
  done
}
