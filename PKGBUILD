# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=qt6-pipewirespectrum
_projname=pipewirespectrum
pkgver=0.1.0
pkgrel=1
pkgdesc="PipeWire audio spectrum analyzer for QML"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/pipewirespectrum"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'libpipewire')
makedepends=('cmake')
options=(!debug)
conflicts=('qt6-pipewirespectrum-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c1be44521c2386f7a2190e6ca07b9eec692c4ed765faa29331ea4815d080544')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
