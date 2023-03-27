# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor-git
conflicts=('makoureactor')
pkgver=2.0.0.10
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt6-base' 'zlib' 'libff7tk') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("makoureactor::git+https://github.com/myst6re/makoureactor.git")
md5sums=(SKIP)

pkgver() {
  cd "makoureactor"
  git describe --tags --match '[0-9]*' | sed 's/-/./g;s/v//g'  | grep -o "^[0-9]*.[0-9]*.[0-9]*.[0-9]*"
}

build() {
  cmake -Smakoureactor -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUNDLE_FF7TK_QM=OFF
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
