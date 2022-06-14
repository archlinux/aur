# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Previous maintainer: Mark Vainomaa <mikroskeem round around a mikroskeem dot eu>

pkgname=quakespasm
pkgver=0.94.5
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. Stable version with optional Mission pack desktop files."
arch=('i686' 'x86_64')
url="http://quakespasm.sourceforge.net"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2')
conflicts=('quakespasm-svn')
install="${pkgname}.install"
source=("https://sourceforge.net/projects/quakespasm/files/Source/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}-mp1.desktop"
        "${pkgname}-mp2.desktop"
        "${pkgname}-impel.desktop")
sha256sums=('a5369c0f100c919846991ebc4d2c801eaff2c6a6f3645ca913f7479bbbcda0e8'
            '09f6819046421f00dd851c9dc6913e931bf410deb1fc4c11f15ffa56c14a9458'
            '2a1a8ee5f1c2b849cb9e11b61cb2745e791595025acbe779396c41b5ff97ba2a'
            '99a957c430d4a67fd78a9d7f49095a4c00c09a9840c69e347d46863694ebdc76'
            '809d3481fca7ed049965c6aebb5ba40f76ec3058c12eb134758bdcdb246b2847')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/Quake/"
    msg "Starting make..."
    make DO_USERDIRS=1 USE_SDL2=1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/Quake/"
    install -Dm755 quakespasm "${pkgdir}/usr/bin/${pkgname}"
  
    for i in 16 24 32 48 64 72; do
    	# TODO: convert using imagemagick
        install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/Misc/QuakeSpasm_512.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/quakespasm.png"
    done

    install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
#
# Uncomment lines depending on the mission pack(s)
# or extension you have.
#
#    install -Dm644 $srcdir/$pkgname-mp1.desktop $pkgdir/usr/share/applications/$pkgname-mp1.desktop
#    install -Dm644 $srcdir/$pkgname-mp2.desktop $pkgdir/usr/share/applications/$pkgname-mp2.desktop
#    install -Dm644 $srcdir/$pkgname-impel.desktop $pkgdir/usr/share/applications/$pkgname-impel.desktop
}


