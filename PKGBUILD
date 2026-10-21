# Maintainer: Nicolai VdS <nicolai@nvds.be>
pkgname=obs-plugin-aitum-multistream-git
_pkgname=obs-aitum-multistream
pkgver=1.0.9.r0.g93add98
pkgrel=1
pkgdesc="OBS Studio plugin to multistream by aitum"
arch=('x86_64')
url="https://github.com/Aitum/obs-aitum-multistream"
license=('GPL-2.0-only')
groups=('obs-plugins')
depends=(
    'obs-studio>=30.0.0'
    'qt6-base'
    'curl'
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
    cmake -S "${_pkgname}" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_OUT_OF_TREE=On
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
