# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7.3
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('nemo-qml-plugin-configuration'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake' 'git')
source=("git+https://github.com/nemomobile-ux/qtquickcontrols-nemo.git#tag=$pkgver")
sha512sums=('9b05c6b96696e024ef7880bf3c83cd39eaf472a639a07551a3a3ecbd85f0cc6c25f642f080252abc031942f5f3a37e524118d517c2e841bf6459c498b49a428f')

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
