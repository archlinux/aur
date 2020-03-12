# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mupen64plus-gui-git
pkgver=r196.g4b03f9f
pkgrel=1
pkgdesc='Mupen64Plus Graphical User Interface written in Qt5 (git version)'
arch=('x86_64')
url='https://github.com/m64p/mupen64plus-gui/'
license=('GPL3')
depends=('gcc-libs' 'qt5-base' 'sdl2' 'p7zip' 'mupen64plus-git')
makedepends=('git')
provides=('mupen64plus-gui')
conflicts=('mupen64plus-gui')
source=('git+https://github.com/m64p/mupen64plus-gui.git'
        'git+https://github.com/mupen64plus/mupen64plus-core.git'
        'mupen64plus-gui.desktop')
sha256sums=('SKIP'
            'SKIP'
            '701550049301d06472fc25f72d8d0599d6d350762e84012f87b113ee68e905de')

prepare() {
    mkdir -p mupen64plus-gui/build
}

pkgver() {
    cd mupen64plus-gui
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd mupen64plus-gui/build
    qmake-qt5 ../mupen64plus-gui.pro
    make
}

package() {
    # binary
    install -D -m755 mupen64plus-gui/build/mupen64plus-gui -t "${pkgdir}/usr/bin"
    
    # icon
    install -D -m644 mupen64plus-gui/mupen64plus.ico "${pkgdir}/usr/share/pixmaps/mupen64plus-gui.ico"
    
    # desktop file
    install -D -m644 mupen64plus-gui.desktop -t "${pkgdir}/usr/share/applications"
}
