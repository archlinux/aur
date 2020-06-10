# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=cli11
_pkgname=CLI11
pkgver=1.9.0
pkgrel=1
pkgdesc='Command line parser for C++11'
arch=('any')
url='https://github.com/CLIUtils/CLI11'
license=('CUSTOM')
makedepends=('cmake')
source=("https://github.com/CLIUtils/CLI11/archive/v${pkgver}.zip")
sha256sums=('1851f8885ad8a93642594beae17aa8bf8b7d13604ba05a9a54a677a7fab8ce89')

build() {
    cd "${_pkgname}-${pkgver}"
    cmake -H. -Bbuild \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCLI11_BUILD_TESTS=OFF \
        -DCLI11_BUILD_EXAMPLES=OFF

    cmake --build build
}

package() {
    cd "${_pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
