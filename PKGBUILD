pkgname=qqc2-breeze-style-git
_pkgname=qqc2-breeze-style
pkgver=r105.96d00f7
pkgrel=2
pkgdesc="Breeze inspired QQC2 Style"
arch=('x86_64' 'armv7' 'aarch64')
url="https://invent.kde.org/plasma/qqc2-breeze-style"
license=('GPL3')
depends=(qt5-base qt5-declarative qt5-quickcontrols2 kirigami2)
makedepends=('git')
provides=(qqc2-breeze-style)
conflicts=(qqc2-breeze-style)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd ${_pkgname}
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
