# Contributor : anish [ at ] gatech [dot] edu
# Maintainer  : anish [ at ] gatech [dot] edu

pkgname=piaware-git
_gitname=piaware
pkgver=2.1.2.r21.g4e2255d
pkgrel=1

pkgdesc="Client-side package and programs for forwarding ADS-B data to FlightAware"

arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/piaware"
license=('BSD')

depends=('dump1090-fa-git' 'tcl' 'tcllib' 'tclx' 'tk' 'tls' 'python' 'tcllauncher')
makedepends=('git' 'autoconf' 'tcl' 'python' 'tcllauncher')
optdepends=('mlat-client: M-LAT support')

source=('piaware::git+git://github.com/flightaware/piaware')
md5sums=('SKIP')
install=piaware-git.install

_gitname=piaware

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {

  install -D /usr/bin/tcllauncher ${pkgdir}/usr/bin/tcllauncher
  cd "${srcdir}/${_gitname}"
  make install DESTDIR=${pkgdir} SYSTEMD=usr/lib/systemd/system
  rm ${pkgdir}/usr/bin/tcllauncher

  chmod -x "${pkgdir}/usr/lib/systemd/system/piaware.service"
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
