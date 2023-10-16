_pkgname=waycratelock
pkgname=waycratelock-git
pkgver=r41.bf28449
pkgrel=2
pkgdesc="waycratelock, lock for ext-session-lock"
url="https://github.com/waycrate/waycratelock"
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('git' 'ninja' 'cmake' 'wayland-protocols' 'session-lock-qt')
depends=('qt6-wayland' 'qt6-base' 'pam')
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
