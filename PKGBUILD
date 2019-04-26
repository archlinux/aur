# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='kindd-git'
pkgver=r25.14474eb
pkgrel=1
pkgdesc=" A Kindflul dd gui written in qt quick. (Github version)"
arch=('any')
url="https://github.com/LinArcX/Kindd"
license=('GPL-3.0')
depends=('coreutils' 'polkit' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-graphicaleffects')
makedepends=('git' 'qt5-base')
source=("${pkgname}::git+https://github.com/LinArcX/Kindd.git")
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
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 ./kindd ${pkgdir}/usr/bin/kindd
  install -Dm644 ./appconf/kindd.desktop ${pkgdir}/usr/share/applications/kindd.desktop
  install -Dm644 ./appconf/kindd.svg ${pkgdir}/usr/share/pixmaps/kindd.svg
  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/kindd/LICENSE
}

