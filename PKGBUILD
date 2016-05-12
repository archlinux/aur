# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=deepinwine-qqintl
pkgver=0.1.3_2
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='Wine QQ International 2012 by Deepin.'
arch=('i686' 'x86_64')
url='http://www.imqq.com/'
license=('custom')
depends=('wine' 'wine-mono' 'sh')
depends_i686=('gtk2' 'lcms' 'ncurses' 'alsa-plugins' 'libsm' 'libpng12')
depends_x86_64=('lib32-gtk2' 'lib32-lcms' 'lib32-ncurses' 'lib32-alsa-plugins' 'lib32-libsm' 'lib32-libpng12')
options=('!strip' '!emptydirs')
conflicts=('wine-qqintl')
source=("wine-qqintl_${_pkgver}_i386.deb::http://downloads.sourceforge.net/deepinwine-qqintl/wine-qqintl_${_pkgver}_i386.deb"
        "qqintl.png"
        "wine-qqintl")
md5sums=('d0f3340da494a6b20c768b0bd51a999d'
         '4068748799fe81a37120a7e3405f2283'
         '84f607a1c81c583830f99b9d2256e559')

build() {
    bsdtar -xvf data.tar.gz
}

package() {
    install -dm755 "${pkgdir}/opt/deepinwine"

    cp -r './usr/share/deepinwine/'* "${pkgdir}/opt/deepinwine/"
    rm -rf "${pkgdir}/opt/deepinwine/qqintl/"{'wine-qqintl','wine'}

    install -Dm755 "wine-qqintl" "${pkgdir}/usr/bin/wine-qqintl"
    install -Dm644 "qqintl.png" "${pkgdir}/usr/share/pixmaps/qqintl.png"
    install -Dm644 "./usr/share/applications/qqintl.desktop" "${pkgdir}/usr/share/applications/qqintl.desktop"
    install -Dm644 "./usr/share/doc/wine-qqintl/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    install -Dm644 "./usr/share/doc/wine-qqintl/changelog.Debian.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

