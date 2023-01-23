# Maintainer: haha662 <i at haha dot moe>
# Contributor: Yigit Dallilar <yigit.dallilar at gmail dot com>

pkgname=ds9
pkgver=8.4.1
pkgrel=1
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
license=('GPL2')
depends=()
makedepends=(libx11 libxslt libxml2 libxft tcl zip)
replaces=()
backup=()
source=("https://github.com/SAOImageDS9/SAOImageDS9/archive/v${pkgver}.tar.gz"
        "ds9.desktop"
        "ds9.png")
sha256sums=('1c6e23b79c9747f78afa9dcdd5da2fc086156acdfc61ff09a5507cdfca3dce71'
            'ee493d31fed473493cc95a177f753fb73c92d699acd47ff7d6f491f3bcd84ccf'
            'ff5f38cfdfd59aee262ae3443fddf35d644b8604c9d6ab07eb96a137ee0a0d28')

build() {
    LDFLAGS="-lm $LDFLAGS"
    echo $LDFLAGS
    cd ${srcdir}/SAOImageDS9-${pkgver}
    unix/configure
    make
}

package() {
    
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    cd ${srcdir}/SAOImageDS9-${pkgver}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 bin/ds9 ${pkgdir}/usr/bin/${pkgname}

}

# vim:set ts=4 sw=4 et:

