# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>

pkgname=unifont-otb
pkgver=15.0.01
pkgrel=1
pkgdesc="A free bitmap font with wide Unicode support (OTB version generated with fonttosfnt)"
arch=('any')
license=('GPL2')
url="https://ftp.gnu.org/gnu/unifont"
makedepends=('fonttosfnt-git')
conflicts=('otb-unifont')
source=("https://ftp.gnu.org/gnu/unifont/unifont-${pkgver}/unifont-${pkgver}.bdf.gz"{,.sig} "https://unifoundry.com/LICENSE.txt")
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy
md5sums=('2907ccbd46da1d1053bb6effeede024f'
         'SKIP'
         '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')

build() {
	cd "${srcdir}"
	f="unifont-${pkgver}.bdf"
    fonttosfnt -b -c -g 2 -m 2 -o "${f/bdf/otb}" "$f"
}

package() {
    cd "${srcdir}"
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    for f in *.otb; do
        install -Dm 644 "${f}" "${pkgdir}/usr/share/fonts/misc/${f}"
    done
}
