# Maintainer: Mads Mogensen <mads256h at gmail dot com>

pkgname=demoinfo
pkgver=1.1
pkgrel=1
pkgdesc="Displays info about a source engine demo file."
arch=('any')
url="https://github.com/mads256h/${pkgname}"
license=('GPL3')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mads256h/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('081e20b230a46b0371e6aef3e528a7320ad71b7b9463c5ffc5e0f7b1875e3bea')

build() {
    # Project does not support in-source builds
    mkdir "${srcdir}/build"

    pushd "${srcdir}/build"

    # Configure project
    cmake "${srcdir}/${pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=MinSizeRel

    # Build project
    cmake --build . --config MinSizeRel

    popd
}

package() {
    # Install the program
    install -Dm755 "${srcdir}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
