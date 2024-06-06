# Maintainer: iamawacko <iamawacko@protonmail.com>

pkgname=openspace
pkgver=0.19.2
pkgrel=1
pkgdesc="OpenSpace is an open source, non-commercial, and freely available interactive data visualization software designed to visualize the entire known universe and portray our ongoing efforts to investigate the cosmos"
arch=('x86_64')
url="https://github.com/OpenSpace/OpenSpace"
license=('MIT')
makedepends=('glm' 'websocketpp')
depends=()
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/OpenSpace/OpenSpace/archive/refs/tags/releases/v${pkgver}.tar.gz"
	"ghoul.tar.gz::https://github.com/OpenSpace/Ghoul/archive/refs/tags/v0.25.0.tar.gz")
sha256sums=('5de0b9f4b74592bdc123bfb7eb5e3c8019086cf2093e0b076552ade5892e7cd9'
            'b9f7845fb36fe3fda28eafa5117ca86b341c5a70946dfba1b1802aa622a402d5')


build() {
    cd "${srcdir}/Ghoul-0.25.0/"
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ./
    make

    cd "${srcdir}/OpenSpace-releases-v${pkgver}"
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd "${srcdir}/OpenSpace-releases-v${pkgver}"
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}
