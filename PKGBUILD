pkgname=caelum-git
pkgver=0.6.1
pkgrel=4
pkgdesc="Library for OGRE targeted at helping to create nice-looking atmospheric effects."
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/Caelum"
depends=('ogre' 'cegui' 'doxygen' 'boost')
makedepends=('cmake' 'git')
provides=('caelum')
conflicts=('caelum')
license=('LGPL')
source=("git+https://github.com/skybon/caelum")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/caelum

  # get a clean build dir
  # [[ -d build ]] && rm -rf build
  # mkdir build && cd build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/caelum/build
  make DESTDIR=${pkgdir} install
}
