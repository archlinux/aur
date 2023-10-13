_pkgname=session-lock-qt
pkgname=session-lock-qt-git
pkgver=r36.8c631fb
pkgrel=1
pkgdesc="session-lock-qt"
url="https://github.com/waycrate/qt-session-lock"
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('git' 'ninja' 'cmake' 'wayland-protocols')
depends=(qt6-wayland)
provides=('session-lock-qt')
conflicts=('session-lock-qt')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  cmake -GNinja \
        -DQT_PLUGIN_INSTALL_DIR=/usr/lib/qt6/plugins/ \
        -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir" ninja install
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
