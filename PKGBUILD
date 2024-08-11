# Maintainer: Nicolai VdS <nicolai@nvds.be>

pkgname=obs-plugin-aitum-multistream-git
_pkgname=obs-aitum-multistream
pkgver=1.0.3.r0.g4bcc6c3
pkgrel=1
pkgdesc="OBS Studio plugin to multistream by aitum"
arch=('x86_64')
url="https://github.com/Aitum/obs-aitum-multistream"
license=('GPL2')
groups=('obs-plugins')
depends=(
    'obs-studio>=30.0.0'
)
makedepends=(
    'cmake'
    'make'
    'gcc'
    'git'
)
provides=('obs-plugin-aitum-multistream')
conflicts=()
options=()
source=('git+https://github.com/Aitum/obs-aitum-multistream.git#branch=main')
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
	install -D -m755 "${_prjdir}/build/aitum-multistream.so" "${pkgdir}/usr/lib/obs-plugins/aitum-multistream.so"
	install -D -m644 "${_prjdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/aitum-multistream"
	cp -r "${_prjdir}/data/locale" "${pkgdir}/usr/share/obs/obs-plugins/aitum-multistream/locale"
}
