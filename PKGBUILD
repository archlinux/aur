# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=sc-controller
pkgver=0.5.3
pkgrel=1
pkgdesc='User-mode driver, mapper and GTK3 based GUI for Steam Controller, DS4 and similar controllers'
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
conflicts=('scc')
source=("${pkgname}-${pkgver}::git+https://github.com/C0rn3j/sc-controller.git#tag=v${pkgver}")
sha256sums=('942a19da7fbbb6229f7050227a13a8f9dea933956b99fb83dad0c520e8adf05f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
