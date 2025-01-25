# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=sc-controller
pkgver=0.5.0
pkgrel=2
pkgdesc='User-mode driver, mapper and GTK3 based GUI for Steam Controller, DS4 and similar controllers.'
arch=('x86_64' 'aarch64')
url='https://github.com/C0rn3j/sc-controller'
license=('GPL-2.0-only')
depends=(
	'gtk3'
	'gtk-layer-shell'
	'libayatana-appindicator'
	'python-cairo'
	'python-evdev'
	'python-gobject'
	'python-ioctl-opt'
	'python-libusb1'
	'python-pylibacl'
	'python-setuptools'
	'python-vdf'
	'xorg-xinput'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
)
conflicts=("${pkgname}-git" 'scc')
source=(
	"${pkgname}-${pkgver}::git+https://github.com/C0rn3j/sc-controller.git#tag=v${pkgver}")
#	"${pkgname}-${pkgver}.tar.gz::https://github.com/C0rn3j/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('8116c7a7a5a2cfd2aaac5412c4cdb88489ce73eb82b9100fe3006845255df576')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
