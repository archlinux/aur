# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Co-Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=sc-controller-git
pkgver=0.4.9.3.r4.5d8aa46
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
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
	'python-pylibacl'
	'python-setuptools'
	'python-vdf'
	'xorg-xinput')
makedepends=(
	'git'
	'python-poetry'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'scc')
source=('sc-controller'::'git+https://github.com/C0rn3j/sc-controller.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//')"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
