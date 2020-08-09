# Maintainer: Mads Mogensen <mads256h at gmail dot com>

pkgname=hacker-typer
pkgver=1.2
pkgrel=3
pkgdesc="A program that mimics the website hackertyper.com on your terminal."
arch=('any')
url="https://github.com/mads256h/hacker-typer"
license=('GPL3')
depends=('ncurses')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mads256h/hacker-typer/archive/v${pkgver}.tar.gz")
sha256sums=('1b664345f90f54821d27656ed6cb27c5e6c315e0f3abf2753a09b9289af85da9')

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
    install -Dm755 "${srcdir}/build/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
