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
source=("https://gitlab.com/osslugaru/lugaru/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.desktop")
sha256sums=('b165ff8948f634fc788dc29b9269746340a290fc2101d843e270190a49c2ef00'
            'c97bbd82701c07692f35fd86d0a4b4fdb2d5380a5672dde75617ae15389bfd15')

            
build() {
    cd ${srcdir}/${pkgname}-${pkgver}/
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
    cd ${srcdir}/${pkgname}-${pkgver}/build
    make DESTDIR="$pkgdir/" install

}
