pkgname=openspace
pkgver=0.18.2 
pkgrel=1
pkgdesc="OpenSpace is an open source, non-commercial, and freely available interactive data visualization software designed to visualize the entire known universe and portray our ongoing efforts to investigate the cosmos"
arch=('x86_64')
url="https://github.com/OpenSpace/OpenSpace"
license=('MIT')
makedepends=('glm' 'websocketpp')
depends=()
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/OpenSpace/OpenSpace/archive/refs/tags/releases/v${pkgver}.tar.gz"
	"ghoul.tar.gz::https://github.com/OpenSpace/Ghoul/archive/refs/tags/v0.25.0.tar.gz")
sha256sums=('2f13eadb48370275ef2b91db5e664b0148863f489cbe3d94525a78622e0bd6f9'
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
