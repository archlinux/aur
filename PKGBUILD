# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=sc-controller
pkgver=0.5.5
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
sha256sums=('3e1e47da34a60d488e8a228559a53aa16b19ca300d09621cf1a5d3ba646b6539')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
