# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=mupen64plus-gui-git
pkgver=r162.8077d7d
pkgrel=1
pkgdesc='Mupen64Plus Graphical User Interface written in Qt5 (git version)'
arch=('i686' 'x86_64')
url='https://github.com/m64p/mupen64plus-gui/'
license=('GPL3')
depends=('gcc-libs' 'qt5-base' 'sdl2' 'zlib')
makedepends=('git')
provides=('mupen64plus-gui')
conflicts=('mupen64plus-gui')
source=("$pkgname"::'git+https://github.com/m64p/mupen64plus-gui.git'
        'mupen64plus-gui.desktop')
sha256sums=('SKIP'
            '10aef6fadef59a92cbfd754ee6164b4c34cef43a4de230ef119757f7ea03eeb2')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    
    mkdir -p build
    cd build
    
    qmake-qt5 ../mupen64plus-gui.pro
    
    make
}

package() {
    cd "${pkgname}/build"
    
    # binary
    install -D -m755 mupen64plus-gui -t "${pkgdir}/usr/bin"
    
    # icon
    cd "${srcdir}/${pkgname}"
    install -D -m644 mupen64plus.ico -t "${pkgdir}/usr/share/pixmaps"
    
    # desktop file
    cd "$srcdir"
    install -D -m644 mupen64plus-gui.desktop -t "${pkgdir}/usr/share/applications"
}
