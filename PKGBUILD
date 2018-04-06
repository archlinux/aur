# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=adriconf
pkgver=0.1.beta.1
_srcver="${pkgver/.beta/-beta}"
pkgrel=1
pkgdesc='Advanded DRI Configurator for the Mesa drivers'
arch=('i686' 'x86_64')
url='https://github.com/jlHertel/adriconf/'
license=('GPL3')
depends=('mesa' 'gtkmm3' 'boost-libs' 'libxml++' 'libx11' 'libdrm' 'pciutils')
makedepends=('cmake' 'boost' 'gettext' 'gtest')
conflicts=('adriconf-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/jlHertel/adriconf/archive/v${_srcver}.tar.gz"
        'adriconf.desktop'
        'adriconf.png')
sha256sums=('aa4529656d652a297faf4b1afae8a868cc4e85b9e43ada2cdd2a7d0bcafe4a4e'
            'bcdd0e3de71922741b26932b75f050da16bcc966d0256bf32f942ac715987967'
            '7d5d467bafd07a39fe1590ff399a2ef9d4eb973777369b308f87556bc4e3786d')

build() {
    cd "${pkgname}-${_srcver}"
    
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
    cd "${pkgname}-${_srcver}/build"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 adriconf "${pkgdir}/usr/bin/adriconf"
    
    install -D -m644 "${srcdir}/adriconf.desktop" "${pkgdir}/usr/share/applications/adriconf.desktop"
    
    install -D -m644 "${srcdir}/adriconf.png" "${pkgdir}/usr/share/pixmaps/adriconf.png"
}
