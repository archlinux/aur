# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

_pkgname=OpenBoardView
pkgname=${_pkgname,,}
pkgver=7.3
pkgrel=1
pkgdesc='Linux SDL/ImGui edition software for viewing .brd files'
arch=('i686' 'x86_64')
url='https://openboardview.org/'
license=('MIT')
depends=('sdl2' 'fontconfig' 'sqlite' 'gtk3')
makedepends=('cmake' 'sdl2' 'zlib' 'gtk3' 'fontconfig' 'sqlite' 'libpng' 'python')
source=("git+https://github.com/OpenBoardView/OpenBoardView.git#tag=R${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 build/src/openboardview/openboardview "${pkgdir}/usr/bin/openboardview"
    install -Dm755 utilities/bvconv.sh "${pkgdir}/usr/bin/bvconv"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
