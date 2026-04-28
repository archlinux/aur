pkgname=session-lock-qt
_reponame=qt-session-lock
pkgver=2.1.0
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
sha256sums=('e5dd5680e0d6c7d23d7d72e804fb1790a05373ca2cbd505b618d0aed622d7050')

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
