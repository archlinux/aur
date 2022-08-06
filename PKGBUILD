# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=libff7tk-git
pkgver=0.82.1.4
pkgrel=1
provides=('libff7tk')
conflicts=('libff7tk')
pkgdesc="Final Fantasy 7 Tool library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/sithlord48/ff7tk"
license=('GPL3')
makedepends=('cmake' 'git' 'doxygen')
depends=('qt6-base' 'qt6-tools' 'qt6-svg' 'qt6-declarative' 'qt6-5compat' 'zlib') #Qt6)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=('git://github.com/sithlord48/ff7tk.git')
md5sums=(SKIP)
options+=(!strip)

pkgver() {
  cd "ff7tk"
  git describe | cut -c2-9 | sed 's/-/./g'
}

build() {
  cd "ff7tk"
  cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  cd "ff7tk"
  DESTDIR="$pkgdir" cmake --install build
}
