# Maintainer: Ysblokje <ysblokje at gmail dot com>
# git version for the opensourced starruler2 
pkgname=starruler2-git
pkgver=dad50e1
pkgrel=1
pkgdesc="4X Space Strategy game Star Ruler 2's open source distribution."
arch=('x86_64')
url="http://starruler2.com/"
license=('MIT')
depends=('libpng' 'zlib' 'glew' 'glu' 'freetype2' 'libvorbis' 'libogg' 'openal' 'bzip2' 'libxrandr' 'curl')
optdepends=()
makedepends=('git' 'cmake' 'imagemagick' 'gcc' 'make')
provides=('starruler2')
conflicts=()
source=("git+https://github.com/BlindMindStudios/StarRuler2-Source.git")
sha256sums=('SKIP')

pkgver() {
    cd StarRuler2-Source
    echo $(git rev-parse --short HEAD)
}

build() {
    cd StarRuler2-Source
    LDFLAGS=-std=c++11 make -k -f source/linux/Makefile compile -j`nproc`
    convert sr2.ico sr2.png
}

prepare() {
   echo "prepare"
}

package() {
    echo "package"
    dest=${pkgdir}/opt/starruler2/
    mkdir -p ${pkgdir}/usr/share/{pixmaps,applications}
    cp ${startdir}/starruler2.desktop ${pkgdir}/usr/share/applications/
    cd ${srcdir}/StarRuler2-Source
    cp sr2.png ${pkgdir}/usr/share/pixmaps/
    mkdir -p ${dest}
    chmod +x StarRuler2.sh
    cp -a StarRuler2.sh ${dest}
    cp -a bin maps mods locales data scripts ${dest}
}
