# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='soha-git'
pkgver=r8.b113d54
pkgrel=1
pkgdesc="A modern persian calendar written by qt to see dates and events in a quick glance. (Github version)"
arch=('any')
url="https://github.com/LinArcX/Soha"
license=('GPL-3.0')
depends=('qt5-quickcontrols2' 'qt5-quickcontrols')
makedepends=('git' 'qt5-base')
source=("${pkgname}::git+https://github.com/LinArcX/Soha.git")
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
  install -Dm755 ./soha ${pkgdir}/usr/bin/soha
  install -Dm644 ./AppConf/soha.desktop ${pkgdir}/usr/share/applications/soha.desktop
  install -Dm644 ./AppConf/soha.svg ${pkgdir}/usr/share/pixmaps/soha.svg
  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/soha/LICENSE
}
