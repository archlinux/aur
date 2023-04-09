# Maintainer: mesmer <ldepaulaf dot gmail dot com>

pkgname=obs-plugin-vertical-canvas-git
_pkgname=obs-vertical-canvas
pkgver=1.2.1.r4.g392729a
pkgrel=1
pkgdesc='OBS Studio plugin to record in vertical canvas by aitum.'
arch=('x86_64')
url='https://github.com/Aitum/obs-vertical-canvas'
license=('GPL2')
groups=('obs-plugins')
depends=(
	'obs-studio>=29.0.0'
)
makedepends=(
	'cmake'
	'make'
	'gcc'
	'git'
)
provides=('obs-plugin-vertical-canvas')
conflicts=()
options=()
source=('git+https://github.com/Aitum/obs-vertical-canvas.git#branch=main')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake -S . -B build -DBUILD_OUT_OF_TREE=On  
	cmake --build build
}

package() {
	_prjdir="${srcdir}/${_pkgname}"
	install -D -m755 "${_prjdir}/build/rundir/RelWithDebInfo/obs-plugins/64bit/vertical-canvas.so" "${pkgdir}/usr/lib/obs-plugins/vertical-canvas.so"
	install -D -m644 "${_prjdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/vertical-canvas"
	cp -r "${_prjdir}/build/rundir/RelWithDebInfo/data/obs-plugins/vertical-canvas/data/locale" "${pkgdir}/usr/share/obs/obs-plugins/vertical-canvas/locale"
	cp -r "${_prjdir}/build/rundir/RelWithDebInfo/data/obs-plugins/vertical-canvas/data/images" "${pkgdir}/usr/share/obs/obs-plugins/vertical-canvas/images"
}

