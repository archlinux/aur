# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dde-appearance-git
pkgver=1.1.65.r0.g189aa20
pkgrel=1
pkgdesc='Application resource management and control services for the dde desktop environment'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-appearance"
license=('GPL3')
depends=('dtk6core'
         'deepin-service-manager'
         'gsettings-qt6')
makedepends=('git' 'cmake' 'ninja' 'qt6-tools')
conflicts=('deepin-appearance')
provides=('deepin-appearance')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd dde-appearance
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dde-appearance
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc
  ninja
}

package() {
  cd dde-appearance
  DESTDIR="$pkgdir" ninja install
}

