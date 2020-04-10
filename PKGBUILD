# Maintainer: ju.adde-gmail-com
# Contributor: vorpalblade77@gmail.com
pkgname=python-steamcontroller-git
_pkgname=steamcontroller
pkgver=1.2.r13.g80928ce
pkgrel=2
pkgdesc="Standalone userland driver for the Steam controller"
arch=('i686' 'x86_64')
url="https://github.com/ynsta/${_pkgname}"
license=('MIT')
makedepends=('python-distutils-extra')
depends=('python-libusb1' 'python-psutil')
optdepends=('python-pyside: Required for sc-gyro-plot.py'
	'python-pyqtgraph: Required for sc-gyro-plot.py'
	'steam: udev rules for the controller')
provides=('steamcontroller')
conflicts=("${_pkgname}")
changelog='changelog.txt'
source=("git+https://github.com/ynsta/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
	install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 res/sc-xbox.service "${pkgdir}/usr/lib/systemd/system/sc-xbox.service"
}
