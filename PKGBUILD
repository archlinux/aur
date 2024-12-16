# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-service-manager-git
pkgver=1.0.8.r0.g4a85b99
pkgrel=1
pkgdesc='Deepin Service Manager'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/deepin-service-manager"
license=('GPL3')
makedepends=('boost' 'cmake' 'ninja' 'qt6-tools' )
groups=('deepin-git')
provides=('deepin-service-manager')
conflicts=('deepin-service-manager')
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-service-manager")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -GNinja -B build -S $pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc
  cmake --build build
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
