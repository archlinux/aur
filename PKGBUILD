pkgname=asus-tuf-keyboard-rgb-manager-git
pkgver=r10.77d42e5
pkgrel=1
pkgdesc="Desktop control and system service for ASUS TUF keyboard RGB based on standard asus-wmi kernel interfaces"
arch=('x86_64')
url="https://gitlab.com/matdal55/asus-tuf-keyboard-rgb-manager"
license=('GPL-3.0-or-later')
depends=('polkit' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'git' 'ninja' 'pkgconf' 'qt6-tools')
provides=('asus-tuf-keyboard-rgb-manager')
conflicts=('asus-tuf-keyboard-rgb-manager')
options=('!debug')
source=("git+https://gitlab.com/matdal55/asus-tuf-keyboard-rgb-manager.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/asus-tuf-keyboard-rgb-manager"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/asus-tuf-keyboard-rgb-manager"
  cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  cd "${srcdir}/asus-tuf-keyboard-rgb-manager"
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  cd "${srcdir}/asus-tuf-keyboard-rgb-manager"
  DESTDIR="${pkgdir}" cmake --install build
}
