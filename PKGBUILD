# Maintainer: Frantic1048 <archer@frantic1048.com>
pkgdesc='A MIDI file player that teaches you how to play the piano'
pkgname='pianobooster'
pkgver=0.6.4b
pkgrel=1
makedepends=('cmake' 'git' 'glu')
depends=('qt4')
conflicts=()
provides=()
arch=('x86_64')
url='http://pianobooster.sourceforge.net/'
license=('GPL3')
source=("https://sourceforge.net/projects/pianobooster/files/pianobooster/${pkgver}/pianobooster-src-${pkgver}.tar.gz"
    'fix-missing-libs-and-useless-flag.patch')
sha512sums=('1676b127321d6fca4e3e77b5f1f78cfbf1eb71399859af1058c42821cde546dc385137c719d7375215972e4e9ce059278fd030c445787c2937c1420f7b405c03'
    'ab5df88bc15b45de7f9a444daad2b2051e5d0b647b1ce414f308c6ff79e92425ea191cfa44a1e46f956787ae7c3b6d10f509cbbd96fee61ca391c79333f2ed08')

prepare () {
    cd "${srcdir}"
    patch -p1 -i "${srcdir}/fix-missing-libs-and-useless-flag.patch"
}

build () {
    cd "${pkgname}-src-${pkgver}/build"
    cmake ../src
    make
}

package () {
    cd "${pkgname}-src-${pkgver}"

    install -d "${pkgdir}/usr/bin/"
    install -m755 "build/${pkgname}" "${pkgdir}/usr/bin/"

    install -d "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
    install -m664 "src/images/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"

    install -d "${pkgdir}/usr/share/applications/"
    install -m664 "src/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
