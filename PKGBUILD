# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@archlinux.org>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=15.1.05
pkgrel=2
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
makedepends=('fontforge')
provides=('emoji-font')
source=("https://unifoundry.com/pub/unifont/unifont-${pkgver}/unifont-${pkgver}.tar.gz"{,.sig})
sha256sums=('d275f55f4358750e0f86305b92e87b88eb330aa46c15f553d2edf047fb1c23fa'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

build() {
    cd "${srcdir}/unifont-${pkgver}/font"
    # Instead of setting `MAKEFLAGS=-j1`, make the dependency first
    make hex
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
