# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@archlinux.org>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=15.1.01
pkgrel=2
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
makedepends=('fontforge')
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-${pkgver}/unifont-${pkgver}.tar.gz"{,.sig})
sha256sums=('e15f4209a2f7937951681f4522b21a4deb9fb36220c82f8b8cb66e2b1466cdb7'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

build() {
    cd "${srcdir}/unifont-${pkgver}/font"
    # This is required because the jobs look for a compiled file before it is compiled
    MAKEFLAGS="-j1"
    make truetype
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/fonts/Unifont/"
	install -m644 "unifont-${pkgver}/font/compiled/unifont-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont.ttf"
	install -m644 "unifont-${pkgver}/font/compiled/unifont_jp-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont_jp.ttf"
	install -m644 "unifont-${pkgver}/font/compiled/unifont_upper-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont_Upper.ttf"
	install -m644 "unifont-${pkgver}/font/compiled/unifont_csur-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont_CSUR.ttf"
}
