# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=adriconf
pkgver=1.0
pkgrel=1
pkgdesc='Advanded DRI Configurator for the Mesa drivers'
arch=('i686' 'x86_64')
url='https://github.com/jlHertel/adriconf/'
license=('GPL3')
depends=('mesa' 'gtkmm3' 'boost-libs' 'libxml++' 'libx11' 'libdrm' 'pciutils')
makedepends=('cmake' 'boost' 'gettext' 'gtest')
conflicts=('adriconf-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/jlHertel/adriconf/archive/v${pkgver}.tar.gz"
        'adriconf.desktop'
        'adriconf.png')
sha256sums=('1d4546e906ddcb45e16a0cf4742360375ff02530e6de126bf91378a1e68e5948'
            'bcdd0e3de71922741b26932b75f050da16bcc966d0256bf32f942ac715987967'
            '7d5d467bafd07a39fe1590ff399a2ef9d4eb973777369b308f87556bc4e3786d')

build() {
    cd "${pkgname}-${pkgver}"
    
    mkdir -p build
    cd build
    
    cmake \
        -G'CodeBlocks - Unix Makefiles' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 adriconf "${pkgdir}/usr/bin/adriconf"
    
    install -D -m644 "${srcdir}/adriconf.desktop" "${pkgdir}/usr/share/applications/adriconf.desktop"
    
    install -D -m644 "${srcdir}/adriconf.png" "${pkgdir}/usr/share/pixmaps/adriconf.png"
}
