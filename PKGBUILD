# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=mupen64plus-gui-git
_srcname=mupen64plus-gui
pkgver=r164.3bf730a
pkgrel=1
pkgdesc='Mupen64Plus Graphical User Interface written in Qt5 (git version)'
arch=('i686' 'x86_64')
url='https://github.com/m64p/mupen64plus-gui/'
license=('GPL3')
depends=('gcc-libs' 'qt5-base' 'sdl2' 'p7zip')
makedepends=('git')
provides=('mupen64plus-gui')
conflicts=('mupen64plus-gui')
source=('git+https://github.com/m64p/mupen64plus-gui.git'
        'mupen64plus-gui.desktop')
sha256sums=('SKIP'
            '701550049301d06472fc25f72d8d0599d6d350762e84012f87b113ee68e905de')

prepare() {
    cd "$_srcname"
    
    mkdir -p build
}

pkgver() {
    cd "$_srcname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_srcname}/build"
    
    qmake-qt5 ../mupen64plus-gui.pro
    
    make
}

package() {
    # binary
    install -D -m755 "${_srcname}/build/mupen64plus-gui" -t "${pkgdir}/usr/bin"
    
    # icon
    install -D -m644 "${_srcname}/mupen64plus.ico" "${pkgdir}/usr/share/pixmaps/mupen64plus-gui.ico"
    
    # desktop file
    install -D -m644 mupen64plus-gui.desktop -t "${pkgdir}/usr/share/applications"
}
