# Maintainer: Hossein Heydari <arch7nelliel@gmail.com>

pkgname="traqtor-git"
pkgver=r39.7c9798b
pkgrel=1
pkgdesc="Graphical settings app for tractor in Qt"
license=('GPL3')
arch=('any')
url="https://gitlab.com/tractor-team/qtractor"
depends=( 'qt5-quickcontrols2' 'pkgconf')
source=("${pkgname}::git+https://gitlab.com/tractor-team/qtractor.git")
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
  install -Dm755 ./traqtor ${pkgdir}/usr/bin/traqtor

 #  install -Dm644 ./carburetor-master/carburetor ${pkgdir}/usr/bin/carburetor
 #  install -Dm644 ./carburetor-master/man/carburetor.1 ${pkgdir}/usr/share/man/carburetor.1
 #  install -Dm644 ./carburetor-master/desktop/carburetor.desktop ${pkgdir}/usr/share/applications/carburetor.desktop
 #  install -Dm644 ./carburetor-master/desktop/carburetor.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/carburetor.svg

  chmod +x ${pkgdir}/usr/bin/traqtor
}
