# Maintainer: Jan Cholasta <jan at cholasta net>

pkgname=pcexhumed
pkgver=211119
pkgrel=1
pkgdesc='Exhumed / PowerSlave port based on EDuke32'
arch=('i686' 'x86_64')
url='https://gitlab.com/exhumed/exhumed'
license=('GPL' 'custom:BUILD')
depends=('flac'
         'glu'
         'gtk2'
         'libgl'
         'libogg'
         'libvorbis'
         'sdl2'
         'sdl2_mixer'
         'timidity++')
makedepends=('imagemagick')
makedepends_i686=('nasm')
source=("https://gitlab.com/exhumed/exhumed/-/archive/${pkgver}/exhumed-${pkgver}.tar.gz"
        'pcexhumed.desktop')
sha256sums=('4fde2e7c990bb45ba31d3663053c57c4f48cb3176288b1f4628f18fdc3021919'
            'deda95400d3e7b44078cac690fe6203280d0744ee14f523dd715eaf9f567f341')

build() {
    cd exhumed-${pkgver}
    make PACKAGE_REPOSITORY=1 REVFLAG="-DREV=\\\"$pkgver\\\""
    MAGICK_OCL_DEVICE=OFF convert \
        source/exhumed/rsrc/game_icon.ico\[10\] \
        pcexhumed.png
}

package() {
    cd exhumed-${pkgver}
    install -D -t "$pkgdir"/usr/bin pcexhumed
    install -D -t "$pkgdir"/usr/share/licenses/$pkgname -m 644 package/common/buildlic.txt
    install -D -t "$pkgdir"/usr/share/applications -m 644 "$srcdir"/pcexhumed.desktop
    install -D -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps -m 644 pcexhumed.png
}
