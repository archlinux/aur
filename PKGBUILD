pkgname=lugaru
pkgver=1.2
pkgrel=2
pkgdesc="A third-person action game featuring a unique close-range combat system"
url="https://osslugaru.gitlab.io"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl2' 'glu' 'libjpeg-turbo' 'libpng' 'openal' 'libvorbis' 'zlib')
makedepends=('cmake')
conflicts=('lugaru-hg' 'lugaruhd-hg' 'lugaro-git')
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/osslugaru/lugaru/repository/archive.tar.bz2?ref=${pkgver}"
        "${pkgname}.desktop")
sha256sums=('a76d1b1fbc344ae73c5148dc0b0b8cd41720de74857e85b7302abf31cdcbea5b'
            'c97bbd82701c07692f35fd86d0a4b4fdb2d5380a5672dde75617ae15389bfd15')

            
build() {
    cd $srcdir/lugaru-1.2-c7b99378439735c60f84869b05c6ebde53083667/
    mkdir build || true
    cd build
    cmake -DSYSTEM_INSTALL=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DCMAKE_INSTALL_DATADIR=share \
        -DCMAKE_INSTALL_MANDIR=share/man \
        ..
    make
}
package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cd $srcdir/lugaru-1.2-c7b99378439735c60f84869b05c6ebde53083667/build
    make DESTDIR="$pkgdir/" install

}
