# Maintainer: Ckat <ckat@teknik.io>

pkgname=otb-unifont
pkgver=14.0.01
pkgrel=1
pkgdesc="A free bitmap font with wide Unicode support (OTB version)"
arch=('any')
license=('GPL')
url="https://ftp.gnu.org/gnu/unifont"
depends=('fontconfig' 'xorg-fonts-encodings')
makedepends=('fontforge')
conflicts=('bdf-unifont' 'pcf-unifont' 'ttf-unifont-csur' 'hex-unifont')
source=("https://ftp.gnu.org/gnu/unifont/unifont-${pkgver}/unifont-${pkgver}.bdf.gz"{,.sig} 'otbconvert.pe')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy
md5sums=('79cf5e91d2f43fd96ad1c1a3ae792fa6'
         'SKIP'
         '8b6d81ad1956b2d7eb5dbead68dacdf4')

build() {
    gunzip -d --force "${srcdir}/unifont-${pkgver}.bdf.gz"
    ./otbconvert.pe "${srcdir}/unifont-${pkgver}.bdf"
}

package() {
    cd "${srcdir}"
    for f in *.otb; do
        install -Dm 644 "${f}" "${pkgdir}/usr/share/fonts/misc/${f}"
    done
}
