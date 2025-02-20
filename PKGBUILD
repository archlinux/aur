_pkgname=greetd-waycratedm
pkgname=greetd-waycratedm-git
pkgver=r46.f29c3d7
pkgrel=2
pkgdesc="qml desktop manager for greetd"
url="https://github.com/waycrate/greetd-waycratedm"
arch=('x86_64' 'aarch64')
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'ninja' 'cmake' 'wayland-protocols')
depends=('qt6-wayland' 'qt6-base' 'session-lock-qt' 'greetd')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  cmake -GNinja \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
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
