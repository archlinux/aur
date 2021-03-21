# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=hellfire-data-gog
_pkgname=devilutionX
pkgver=1.01
pkgrel=2
pkgdesc="Diablo & Hellfire devolved"
arch=('any')
url="https://www.gog.com/game/diablo"
license=('custom')
makedepends=('innoextract' 'unzip' 'icoutils')
provides=('hellfire-data')
conflicts=('hellfire-data-cd')
source=('setup_diablo_1.09_hellfire_v2_(30038).exe::gog://setup_diablo_1.09_hellfire_v2_(30038).exe')
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('5b9657ab2cbb0dc75de7b4087e63221aa35e4dabb8ce46c265d78a1c23d5d9f9')

build() {
    innoextract -s -L "setup_diablo_1.09_hellfire_v2_(30038).exe"
    unzip -qqjuo app/webcache.zip
    wrestool -x -t -14 -o . diablo.exe
    wrestool -x -t -14 -o . hellfire/hellfire.exe
    icotool -x -o . *.ico
}

package() {
    # install game icons
    install -Dm644 "${srcdir}/c640ceb0c06e742af9657cc964f9ff86e4489b5799c76f4bbaf27b81f9d8b081.png" "${pkgdir}/usr/share/pixmaps/diablo-gog.png"
    install -Dm644 "${srcdir}/diablo.exe_14_101_1_32x32x4.png" "${pkgdir}/usr/share/pixmaps/diablo-blizzard.png"
    install -Dm644 "${srcdir}/hellfire.exe_14_101_1_32x32x4.png" "${pkgdir}/usr/share/pixmaps/hellfire-sierra.png"
    # install game documents
    install -Dm644 "${srcdir}/manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/diablo-manual.pdf"
    install -Dm644 "${srcdir}/patch.txt" "${pkgdir}/usr/share/doc/${_pkgname}/diablo-patch.txt"
    install -Dm644 "${srcdir}/readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/diablo-readme.txt"
    install -Dm644 "${srcdir}/update.txt" "${pkgdir}/usr/share/doc/${_pkgname}/diablo-update.txt"
    install -Dm644 "${srcdir}/hellfire/hellfire.txt" "${pkgdir}/usr/share/doc/${_pkgname}/hellfire.txt"
    install -Dm644 "${srcdir}/hellfire/patch.txt" "${pkgdir}/usr/share/doc/${_pkgname}/hellfire-patch.txt"
    install -Dm644 "${srcdir}/hellfire/readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/hellfire-readme.txt"
    # install gog & blizzard licenses
    install -Dm644 "${srcdir}/tmp/eula.txt"  "${pkgdir}/usr/share/licenses/${_pkgname}/gog-eula.txt"
    install -Dm644 "${srcdir}/license.txt"  "${pkgdir}/usr/share/licenses/${_pkgname}/blizzard-license.txt"
    # install diablo & hellfire data packs
    install -Dm644 "${srcdir}/diabdat.mpq" "${pkgdir}/opt/${_pkgname}/diabdat.mpq"
    install -Dm644 "${srcdir}/hellfire/hellfire.mpq" "${pkgdir}/opt/${_pkgname}/hellfire.mpq"
    install -Dm644 "${srcdir}/hellfire/hfmonk.mpq" "${pkgdir}/opt/${_pkgname}/hfmonk.mpq"
    install -Dm644 "${srcdir}/hellfire/hfmusic.mpq" "${pkgdir}/opt/${_pkgname}/hfmusic.mpq"
    install -Dm644 "${srcdir}/hellfire/hfvoice.mpq" "${pkgdir}/opt/${_pkgname}/hfvoice.mpq"
}
