# Maintainer: Evgeniy Dombek <edombek@yandex.ru>
# Maintainer:  Yigit Dallilar <yigit.dallilar at gmail dot com>

pkgname=ds9
pkgver=8.5
pkgrel=1
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
license=('GPL2')
provides=(ds9)
conflicts=(ds9-bin)
depends=(libx11 zlib libxslt libxml2 libxft tcl tk)
options=(!strip !lto)
makedepends=(gcc make automake autoconf zip)
replaces=()
backup=()
source=("https://github.com/SAOImageDS9/SAOImageDS9/archive/v${pkgver}.tar.gz"
        "ds9.desktop")
md5sums=('066f1537d7f1e62cce9e291318579aa1'
         'f1738e4ec665ae9afd1b65b86e6a07f1')


build() {
    cd ${srcdir}/SAOImageDS9-${pkgver}
    unix/configure
    make
}

package() {
    
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${srcdir}/SAOImageDS9-${pkgver}/ds9/doc/sun.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    cd ${srcdir}/SAOImageDS9-${pkgver}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 bin/ds9 ${pkgdir}/usr/bin/${pkgname}

}

# vim:set ts=4 sw=4 et:

