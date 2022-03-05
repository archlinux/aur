pkgname=caelum-git
pkgver=0.6.3.r38.g7763bff
pkgrel=1
pkgdesc="Library for OGRE targeted at helping to create nice-looking atmospheric effects."
arch=('i686' 'x86_64')
url="https://ogrecave.github.io/ogre-caelum/"
depends=('ogre')
makedepends=('cmake' 'git')
provides=('caelum')
conflicts=('caelum')
license=('LGPL')
source=("git+https://github.com/OGRECave/ogre-caelum.git")
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/ogre-caelum
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/ogre-caelum

  # get a clean build dir
  # [[ -d build ]] && rm -rf build
  # mkdir build && cd build

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd ${srcdir}/ogre-caelum
  make DESTDIR=${pkgdir} install
}
