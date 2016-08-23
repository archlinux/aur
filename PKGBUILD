# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=qmlfmt-git
pkgver=0.1.0.r12.e0f7ec7
pkgrel=1
pkgdesc="Command line application that formats QML files"
arch=('i686' 'x86_64')
url="https://github.com/jesperhh/qmlfmt"
license=('unknown')
depends=('qt5-base')
makedepends=('git' 'cmake>=3.0' 'qt5-script' 'qt5-declarative')
conflicts=('qmlfmt')
provides=('qmlfmt')
source=("git://github.com/jesperhh/qmlfmt.git")
sha512sums=('SKIP')

pkgver() {
  cd qmlfmt
  echo "0.1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../qmlfmt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp build/qmlfmt ${pkgdir}/usr/bin
}
