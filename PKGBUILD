# Maintainer: Hossein Heydari <arch7nelliel@gmail.com>

pkgname='tractor'
_pkgname='tractor-master'
pkgver=r.
pkgrel=1
pkgdesc="Setup an onion routing proxy"
license=('GPL3')
url="https://gitlab.com/tractor-team/tractor"
arch=('any')
depends=( 'python-gobject' 'python-fire' 'python-stem' 'gsettings-desktop-schemas')
source=("https://gitlab.com/tractor-team/tractor/-/archive/master/tractor-master.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}"

  install -Dm644 ./tractor-master/tractor ${pkgdir}/usr/bin/tractor
  install -Dm644 ./tractor-master/SampleBridges ${pkgdir}/usr/share/tractor/SampleBridges
  install -Dm644 ./tractor-master/man/tractor.1 ${pkgdir}/usr/share/man/tractor.1
  install -Dm644 ./tractor-master/tractor.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/tractor.gschema.xml

  chmod +x ${pkgdir}/usr/bin/tractor
}
