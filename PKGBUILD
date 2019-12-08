# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=mediahandling
pkgver=0.0.6
pkgrel=1
pkgdesc="A library solely intended for the use in the project Chestnut by handling all media-file operations"
arch=(x86_64)
url="https://github.com/jonno85uk/mediahandling"
license=('BSD')
depends=('ffmpeg' 'boost-libs' 'fmt')
makedepends=('cmake') 
provides=("${pkgname%}")
source=("https://github.com/jonno85uk/mediahandling/archive/${pkgver}.tar.gz")
md5sums=('0d04f3d9c2e9fe8e8ec975b1899510f8')

prepare() {
    rm -rf "mediahandling/"
    rm -rf ${pkgdir}
    tar xaf "${pkgver}.tar.gz"
    mv mediahandling-${pkgver} mediahandling
    cd "$srcdir/mediahandling"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr/
}

build() {
    cd "$srcdir/mediahandling"
    make
}


package() {
    cd "$srcdir/mediahandling"
    make install
    # Temporary until CMakeLists.txt is updated
    mkdir -p ${pkgdir}/usr/share/licenses/
    cp LICENSE  ${pkgdir}/usr/share/licenses/mediahandling
}
