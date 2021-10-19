# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=cli11
_pkgname=CLI11
pkgver=2.1.2
pkgrel=1
pkgdesc='Command line parser for C++11'
arch=('any')
url='https://github.com/CLIUtils/CLI11'
license=('CUSTOM')
makedepends=('cmake')
source=("https://github.com/CLIUtils/CLI11/archive/v${pkgver}.zip")
sha256sums=('01321456ee9987a833b49325ca99570fdfaa9c44bcab9e4d735b4afb554bad49')

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
