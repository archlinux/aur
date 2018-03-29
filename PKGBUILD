# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='gnulium-git'
pkgver=2.0.0.r0.gf74f89d
pkgrel=1
pkgdesc="A Graphical Ui for managing scripts and ideas! (Github version)"
arch=('any')
url="https://github.com/LinArcX/Gnulium"
license=('GPL-3.0')
depends=('qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-charts' 'jcal-git')
makedepends=('git' 'qt5-base')
source=("${pkgname}::git+https://github.com/LinArcX/Gnulium.git")
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
  install -Dm755 ./gnulium ${pkgdir}/usr/bin/gnulium
  install -Dm644 ./appconf/gnulium.desktop ${pkgdir}/usr/share/applications/gnulium.desktop
  install -Dm644 ./appconf/gnulium.svg ${pkgdir}/usr/share/pixmaps/gnulium.svg
  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/gnulium/LICENSE
}