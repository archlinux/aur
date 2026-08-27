# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7.4
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('nemo-qml-plugin-configuration'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake' 'git')
source=("git+https://github.com/nemomobile-ux/qtquickcontrols-nemo.git#tag=$pkgver")
sha512sums=('90daaf95603b412c7a2d048ec39c7edc964d73ef140fc1a5cf43429ad2447f9d894d8cb778a406339a25cae1cb5c3d16a1605549d043775e6164994b6ecb066a')

prepare() {
  cd qtquickcontrols-nemo
  # Add BUILD_EXAMPLES so the package can skip example apps that depend on Glacier::App:
  # https://github.com/nemomobile-ux/qtquickcontrols-nemo/commit/3b7d10b8603c348526540b2761266230740082d1
  git cherry-pick -n 3b7d10b8603c348526540b2761266230740082d1
}

build() {
  cd qtquickcontrols-nemo
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qtquickcontrols-nemo
  make DESTDIR="$pkgdir" install
}
