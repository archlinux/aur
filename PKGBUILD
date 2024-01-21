# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-app-services-git
pkgver=1.0.25.r0.g9bb99c6
pkgrel=1
pkgdesc='Service collection of DDE applications, including dconfig-center'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-app-services"
license=('GPL3')
depends=(dtkwidget)
makedepends=(cmake gtest ninja dtkcommon)
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
