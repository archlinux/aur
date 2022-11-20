# Maintainer: Giuseppe Calà <gcala at mailbox dot org>

pkgname=kdeltachat-git
pkgver=r195.8cce6d2
pkgrel=2
pkgdesc="KDeltaChat is a Delta Chat client using Kirigami framework"
arch=(x86_64 aarch64)
url="https://git.sr.ht/~link2xt/kdeltachat"
license=(GPL3)
depends=('kirigami2' 'libdeltachat-git' 'qt5-quickcontrols' 'extra-cmake-modules' 'qt5-imageformats' 'qt5-webengine' 'qt5-multimedia' 'qt5ct')
makedepends=('git')
provides=('kdeltachat')
conflicts=('kdeltachat')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
