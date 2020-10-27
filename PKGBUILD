# Maintainer: Axel Moinet (bullekeup) <bullekeup@bullekeup.net>
# Contributor: Axel Moinet (bullekeup) <bullekeup@bullekeup.net>

pkgname=('displayset' 'displayset-udev-rules' 'displayset-doc')
pkgver=0.1
pkgrel=7
pkgdesc='A simple display auto-setup script using xrandr'
arch=('any')
url="https://github.com/bullekeup/displayset"
license=('GPL2')
makedepends=('git')
options=()
source=(git+https://github.com/bullekeup/displayset.git)
md5sums=('SKIP')
depends=('xorg-xrandr')

package_displayset() {
  install -d ${pkgdir}/etc/displayset
  install -m 555 ${srcdir}/displayset/displayset -Dt ${pkgdir}/usr/bin/
}

package_displayset-udev-rules() {
  install=displayset-udev-rules.install
  depends=('displayset' 'udev')
  install -m 664 ${srcdir}/displayset/99-displayset-hotplug.rules -Dt ${pkgdir}/etc/udev/rules.d/  
}

package_displayset-doc() {
  for FILE in $(find ${srcdir}/displayset/sample -maxdepth 1 -type f -printf '%p '); do
    install -m 444 ${FILE} -Dt ${pkgdir}/usr/share/doc/displayset/sample/
  done;
}

