# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: YoyPa <yoann dot p dot public at gmail dot com>

_gitname=isw
pkgname=$_gitname-git
pkgver=1.10.r23.g7c88670
pkgrel=1
pkgdesc="Fan control tool for MSI gaming series laptops"
arch=('any')
url="https://github.com/YoyPa/isw"
license=('GPL3')
depends=('python')
makedepends=('git')
backup=('etc/isw.conf')
conflicts=('isw')
provides=('isw')

source=("git+https://github.com/YoyPa/isw.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
	cd "${_gitname}"
	install -Dm 644 etc/isw.conf "${pkgdir}/etc/isw.conf"
	install -Dm 644 etc/modprobe.d/isw-ec_sys.conf "${pkgdir}/etc/modprobe.d/isw-ec_sys.conf"
	install -Dm 644 etc/modules-load.d/isw-ec_sys.conf "${pkgdir}/etc/modules-load.d/isw-ec_sys.conf"
	install -Dm 644 usr/lib/systemd/system/isw@.service "${pkgdir}/usr/lib/systemd/system/isw@.service"
	install -Dm 755 isw "${pkgdir}/usr/bin/isw"
}
