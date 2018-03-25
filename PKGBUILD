# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=adriconf
pkgver=0.1.alpha
_srcver="${pkgver/.alpha/-alpha}"
pkgrel=1
pkgdesc='Advanded DRI Configurator for the Mesa drivers'
arch=('i686' 'x86_64')
url='https://github.com/jlHertel/adriconf/'
license=('GPL3')
depends=('mesa' 'gtkmm3' 'boost-libs' 'libxml++' 'libx11' 'libdrm' 'pciutils' 'glibc')
makedepends=('cmake' 'boost' 'gettext')
checkdepends=('gtest')
conflicts=('adriconf-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/jlHertel/adriconf/archive/v${_srcver}.tar.gz"
        'adriconf.desktop'
        'adriconf.png')
sha256sums=('4abd1482c6e1025d868e72571629898d50060341eb123696eb93ec6086525377'
            'bcdd0e3de71922741b26932b75f050da16bcc966d0256bf32f942ac715987967'
            '7d5d467bafd07a39fe1590ff399a2ef9d4eb973777369b308f87556bc4e3786d')

build() {
    cd "${pkgname}-${_srcver}"
    
    rm -rf build
    mkdir -p build
    cd build
    
    cmake \
        -G'CodeBlocks - Unix Makefiles' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

check() {
    cd "${pkgname}-${_srcver}/build"
    
    ./runUnitTests
}

package() {
    cd "${pkgname}-${_srcver}/build"
    
    install -D -m755 adriconf "${pkgdir}/usr/bin/adriconf"
    
    install -D -m644 "${srcdir}/adriconf.desktop" "${pkgdir}/usr/share/applications/adriconf.desktop"
    
    install -D -m644 "${srcdir}/adriconf.png" "${pkgdir}/usr/share/pixmaps/adriconf.png"
}
