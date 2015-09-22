pkgname=caelum-git
pkgver=r3.e776a80
pkgrel=1
pkgdesc="Library for OGRE targeted at helping to create nice-looking atmospheric effects."
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/Caelum"
depends=('ogre' 'cegui' 'doxygen' 'boost')
makedepends=('cmake' 'git')
provides=('caelum')
conflicts=('caelum')
license=('LGPL')
source=("git+https://github.com/RigsOfRods/caelum")
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/caelum
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/caelum

  # get a clean build dir
  # [[ -d build ]] && rm -rf build
  # mkdir build && cd build

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/caelum
  make DESTDIR=${pkgdir} install
}
