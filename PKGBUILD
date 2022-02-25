# Maintainer: DingYuan Zhang <justforlxz@gmail.com>

pkgname=deepin-turbo-git
pkgver=0.0.5.r13.g8c85d2c
pkgrel=1
pkgdesc='A daemon that helps to launch applications faster'
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-turbo"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake')
groups=('deepin')
provides=('deepin-turbo')
conflicts=('deepin-turbo')
source=("$pkgname::git://github.com/linuxdeepin/deepin-turbo")
sha512sums=('SKIP')

pkgver() {
    cd $pkgbase
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
