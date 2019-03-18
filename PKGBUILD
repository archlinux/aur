# Maintainer: Hossein Heydari <arch7nelliel@gmail.com>

pkgname='tractor-git'
pkgver=r35.c2f6ce0
pkgrel=1
pkgdesc="Setup an onion routing proxy"
license=('GPL3')
url="https://gitlab.com/tractor-team/tractor"
arch=('any')
depends=( 'python-gobject' 'python-fire' 'python-stem' 'gsettings-desktop-schemas')
source=("${pkgname}::git+https://gitlab.com/tractor-team/tractor.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm644 ./tractor ${pkgdir}/usr/bin/tractor
  install -Dm644 ./SampleBridges ${pkgdir}/usr/share/tractor/SampleBridges
  install -Dm644 ./man/tractor.1 ${pkgdir}/usr/share/man/tractor.1
  install -Dm644 ./tractor.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/tractor.gschema.xml

  chmod +x ${pkgdir}/usr/bin/tractor
}
