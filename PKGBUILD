# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-app-services-git
pkgver=0.0.20.r0.g41ca6e7
pkgrel=1
pkgdesc='Service collection of DDE applications, including dconfig-center'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-app-services"
license=('GPL3')
depends=(dtkwidget-git)
makedepends=(cmake gtest ninja)
groups=(deepin-git)
provides=('deepin-app-services')
conflicts=('deepin-app-services')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-app-services")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake -GNinja . -DCMAKE_INSTALL_PREFIX=/usr -DDVERSION=$pkgver
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
