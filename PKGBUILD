# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='kindd-git'
pkgver=2.1.0.r0.g216e56f
pkgrel=1
pkgdesc="Kindful dd, written by qt-quick. (Github version)"
arch=('any')
url="https://github.com/LinArcX/kindd"
license=('GPL-3.0')
depends=('polkit' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('git' 'cmake' 'qt5-base')
source=("${pkgname}::git+https://github.com/LinArcX/kindd.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build; cd build
  cmake -DCMAKE_BUILD_TYPE=RELEASE ../;
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 ./release/kindd ${pkgdir}/usr/bin/kindd
  install -Dm644 ./assets/appconf/kindd.desktop ${pkgdir}/usr/share/applications/kindd.desktop
  install -Dm644 ./assets/appconf/kindd.svg ${pkgdir}/usr/share/pixmaps/kindd.svg
  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/kindd/LICENSE
}

