# Maintainer: Mads Mogensen <mads256h at gmail dot com>

pkgname=termimg
pkgver=0.1.1
pkgrel=1
pkgdesc="Display images in an X terminal"
arch=('any')
url="https://github.com/mads256h/${pkgname}"
license=('AGPL3')
depends=('libxres' 'procps-ng' 'imlib2')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mads256h/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f3fc6c36b930370bbd1c13387803b1ee8149d7011aa88eb46a9eab9c796429fa')

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
    install -Dm755 "${srcdir}/build/src/${pkgname}-client/${pkgname}-client" "${pkgdir}/usr/bin/${pkgname}-client"
    install -Dm755 "${srcdir}/build/src/${pkgname}-server/${pkgname}-server" "${pkgdir}/usr/bin/${pkgname}-server"
}
