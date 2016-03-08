# Maintainer: Jonas Kahler <jonas@derkahler.de>
pkgname=od-simulation-git
pkgver=v3.0.1
pkgrel=1
pkgdesc="Open Source Development Architecture for Virtual, Networked, and Cyber-Physical System Infrastructures."
arch=('any')
url="http://opendavinci.cse.chalmers.se/www/"
license=('GPL')
depends=('od-libopendlv-git' 'freeglut' 'qt4' 'opencv' 'boost' 'qwt5' 'jdk8-openjdk' 'apache-ant' 'junit')
makedepends=('cmake' 'gcc' 'git' 'make')
provides=('od-simulation-git')
groups=('opendavinci-git')
source=('git://github.com/se-research/OpenDaVINCI.git')
noextract=()
md5sums=('SKIP') #autofill using updpkgsums
_gitname=OpenDaVINCI

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$srcdir/$_gitname/odsimulation"
  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_C_FLAGS:STRING="" \
  -DCMAKE_CXX_FLAGS:STRING="" \
  -DCMAKE_EXE_LINKER_FLAGS:STRING="" \
  -DCMAKE_SHARED_LINKER_FLAGS:STRING="" ..
  make
  make test
}

package() {
  cd "${_gitname}/odsimulation/build"
  make DESTDIR="$pkgdir" install
}
