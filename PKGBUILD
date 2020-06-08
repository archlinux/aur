# Maintainer: hashworks <mail@hashworks.net>

pkgname=brickstrap-git
_pkgname="${pkgname%-git}"
pkgver=0.6.8.r4.ga48aea5
pkgrel=1
pkgdesc='Tool for turning Docker images into bootable image files for embedded systems'
url='https://github.com/ev3dev/brickstrap'
license=('MIT')
arch=('any')
depends=('docker' 'libguestfs')
makedepends=('git')
optdepends=('qemu-arm-static: Build arm images (f.e. LEGO ev3 bricks)')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm644 "${_pkgname}/COPYING.MIT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MIT"
	install -Dm755 "${_pkgname}/src/brickstrap.sh" "${pkgdir}/usr/bin/brickstrap"
}
