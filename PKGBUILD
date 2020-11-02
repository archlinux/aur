# Maintainer: Axel Moinet (bullekeup) <bullekeup@bullekeup.net>
# Contributor: Axel Moinet (bullekeup) <bullekeup@bullekeup.net>

pkgname=('displayset' 'displayset-udev-rules' 'displayset-doc')
pkgver=0.2
pkgrel=1
pkgdesc='A simple display auto-setup script tool using xrandr'
arch=('any')
url="https://github.com/bullekeup/displayset"
license=('GPL2')
makedepends=()
options=()
source=(displayset-v${pkgver}.tar.gz::https://github.com/bullekeup/displayset/archive/v0.2.tar.gz)
md5sums=('268b6449a446814b4eecf33a7c671212')
sha256sums=('2956e7a4c9452ca7b8cfb0c12780c1f375f154dc8de8ae4e9c1321180ada5ee7')
b2sums=('669ea4908edeed18756b50c51344f2eab0a8e46ecf5395f25956d06177a007b5f1e68c9e2e3181ac145bd682350ce9bb084efde7c8d6426a9eaf5032cef74b2f')
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

