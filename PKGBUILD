# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=cli11
_pkgname=CLI11
pkgver=1.6.2
pkgrel=1
pkgdesc='Command line parser for C++11'
arch=('any')
url='https://github.com/CLIUtils/CLI11'
license=('CUSTOM')
makedepends=('cmake')
source=("https://github.com/CLIUtils/CLI11/archive/v${pkgver}.zip")
sha256sums=('36bd9b4bad0f3dc21917e1b852ea13f1e417240efdd7187cef24f5f8700f92ff')

build() {
    cd "${_pkgname}-${pkgver}"
    cmake -H. -Bbuild \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCLI11_TESTING=OFF \
        -DCLI11_EXAMPLES=OFF

    cmake --build build
}

package() {
    cd "${_pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
