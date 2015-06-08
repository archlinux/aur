# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kdesudo-frameworks-hg
pkgver=70
pkgrel=1
pkgdesc="A SUdo frontend for KDE. KF5 Frameworks branch (HG version)"
arch=("i686" "x86_64")
url="https://launchpad.net/kdesudo"
license=("GPL")
depends=('kdelibs4support' 'sudo')
conflicts=('kdesudo')
provides=('kdesudo')
makedepends=('cmake' 'mercurial' 'extra-cmake-modules' 'kdoctools' 'python')
source=("kdesudo::bzr+lp:~kubuntu-kdesudo/kdesudo/frameworks")
sha1sums=('SKIP')

pkgver() {
  cd kdesudo
  echo "$(bzr revno)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesudo \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
