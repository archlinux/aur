# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo-git
conflicts=('blackchocobo')
pkgver=1.15.0.0
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt6-base' 'libff7tk')
makedepends=('cmake' 'git')
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=('blackchocobo::git+https://github.com/sithlord48/blackchocobo.git')
md5sums=(SKIP)

pkgver() {
  cd "blackchocobo"
  git describe --long | sed 's/-/./g;s/v//g'  | grep -o "^[0-9]*.[0-9]*.[0-9]*.[0-9]*"
}

build() {
  cmake -Sblackchocobo -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
