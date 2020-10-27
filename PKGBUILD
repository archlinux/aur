# Maintainer: Axel Moinet (bullekeup) <bullekeup@bullekeup.net>
# Contributor: Axel Moinet (bullekeup) <bullekeup@bullekeup.net>

pkgname=('displayset' 'displayset-udev-rules' 'displayset-doc')
pkgver=0.1
pkgrel=10
pkgdesc='A simple display auto-setup script tool using xrandr'
arch=('any')
url="https://github.com/bullekeup/displayset"
license=('GPL2')
makedepends=()
options=()
source=(displayset-v${pkgver}.tar.gz::https://github.com/bullekeup/displayset/archive/v0.1.tar.gz)
md5sums=('231853628b31acab78bf437a6c113dc5')
sha256sums=('494b47df0d74002d14be241e8675b212e267cd34d5ffe57b3a9e30c71a2a8a03')
b2sums=('4f94bdfc92b845a8e9c39d1e180f1dacac400e0a2ffed458e65acc2aec685388953eb8f3f3509ca574a5092d2842dc968b950330d32db562a6c3942908519d64')
depends=('xorg-xrandr')

package_displayset() {
  install -d ${pkgdir}/etc/displayset
  install -m 555 ${srcdir}/displayset-${pkgver}/displayset -Dt ${pkgdir}/usr/bin/
}

package_displayset-udev-rules() {
  install=displayset-udev-rules.install
  pkgdesc='A simple display auto-setup script tool using xrandr - udev rules'
  depends=('displayset' 'udev')
  install -m 664 ${srcdir}/displayset-${pkgver}/99-displayset-hotplug.rules -Dt ${pkgdir}/etc/udev/rules.d/  
}

package_displayset-doc() {
  depends=()
  pkgdesc='A simple display auto-setup script tool using xrandr - doc and sample config'
  for FILE in $(find ${srcdir}/displayset-${pkgver}/sample -maxdepth 1 -type f -printf '%p '); do
    install -m 444 ${FILE} -Dt ${pkgdir}/usr/share/doc/displayset/sample/
  done;
}

