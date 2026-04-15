pkgname=session-lock-qt
_reponame=qt-session-lock
pkgver=2.0.0
pkgrel=1
pkgdesc="session-lock-qt"
url="https://github.com/waycrate/qt-session-lock"
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('git' 'ninja' 'cmake' 'wayland-protocols')
depends=(qt6-wayland)
provides=('session-lock-qt')
conflicts=('session-lock-qt-git')
source=(
    "${pkgname}-v${pkgver}.tar.gz::https://github.com/waycrate/$_reponame/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('9137d8165537104863f7d6107545bd10d944fc3e82515a8c9e556e3baf10cea8')

build() {
  cd "${_reponame}-$pkgver"
  cmake -GNinja \
        -DQT_PLUGIN_INSTALL_DIR=/usr/lib/qt6/plugins/ \
        -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd "${_reponame}-$pkgver"
  DESTDIR="$pkgdir" ninja install
}
