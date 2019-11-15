# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=mediahandling
pkgver=0.0.5
pkgrel=2
pkgdesc="A library solely intended for the use in the project Chestnut by handling all media-file operations"
arch=(x86_64)
url="https://github.com/jonno85uk/mediahandling"
license=('BSD')
depends=('ffmpeg' 'boost-libs')
makedepends=('cmake') 
provides=("${pkgname%}")
source=("https://github.com/jonno85uk/mediahandling/archive/mediahandling-${pkgver}.tar.gz")
md5sums=('2eb35e081247c261659a2e3fbcf710d5')

prepare() {
    rm -rf "mediahandling/"
    rm -rf ${pkgdir}
    tar xaf "mediahandling-${pkgver}.tar.gz"
    mv mediahandling-mediahandling-${pkgver} mediahandling
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
