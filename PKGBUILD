pkgname=lugaru
pkgver=1.1
pkgrel=1
pkgdesc="A third-person action game featuring a unique close-range combat system"
url="https://osslugaru.gitlab.io"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl2' 'glu' 'libjpeg-turbo' 'libpng' 'openal' 'libvorbis' 'zlib')
makedepends=('cmake')
conflicts=('lugaru-hg')
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/osslugaru/lugaru/repository/archive.tar.bz2?ref=${pkgver}"
        "${pkgname}.desktop")
sha256sums=('4372ef81494365f7227a72051960f3940acf8418006dbdb05c83d12232f481e7'
            'c97bbd82701c07692f35fd86d0a4b4fdb2d5380a5672dde75617ae15389bfd15')

            
build() {
    cd $srcdir/lugaru-1.1-53bbd7b11ba7558692b00d936d3103750fcb430b/
    mkdir build
    cd build
    cmake -DSYSTEM_INSTALL=ON \
        -DCMAKE_INSTALL_BINDIR=games \
        -DCMAKE_INSTALL_DATADIR=share/games \
        -DCMAKE_INSTALL_MANDIR=../man \
        ..
    make
}
package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cd $srcdir/lugaru-1.1-53bbd7b11ba7558692b00d936d3103750fcb430b/build
    make DESTDIR="$pkgdir/" install

}
