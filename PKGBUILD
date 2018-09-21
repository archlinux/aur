# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=adriconf
pkgver=1.3
pkgrel=1
pkgdesc='Advanded DRI Configurator for the Mesa drivers'
arch=('i686' 'x86_64')
url='https://github.com/jlHertel/adriconf/'
license=('GPL3')
depends=('gcc-libs' 'gtkmm3' 'glibmm' 'gtk3' 'glib2' 'libsigc++' 'boost-libs'
         'libxml++2.6' 'libx11' 'libglvnd' 'mesa' 'libdrm' 'pciutils')
makedepends=('cmake' 'boost' 'gettext' 'gtest')
conflicts=('adriconf-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/jlHertel/adriconf/archive/v${pkgver}.tar.gz"
        'adriconf.desktop'
        'adriconf.png')
sha256sums=('564bab30de6f8a4c945ffa5d2fa66fdc9f0cb44608c3eab43df808c6c1332c05'
            'bcdd0e3de71922741b26932b75f050da16bcc966d0256bf32f942ac715987967'
            '7d5d467bafd07a39fe1590ff399a2ef9d4eb973777369b308f87556bc4e3786d')

build() {
    cd "${pkgname}-${pkgver}"
    
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 "${srcdir}/adriconf.desktop" -t "${pkgdir}/usr/share/applications"
    install -D -m644 "${srcdir}/adriconf.png"     -t "${pkgdir}/usr/share/pixmaps"
}
