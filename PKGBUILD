#Base: macfonts
#Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=491114
#Maintainer: jnbek1972 ___AT____ gmail__DOT__com
#Contributor: Shanto (at hotmail.com)
#Contributor: Erus <erus.iluvatar@gmail.com>
pkgname=ttf-mac-fonts
pkgver=20100901.134
pkgrel=1
pkgdesc="Mac fonts including Lucida Grande, Apple Garamond and other fonts from Apple"
arch=('any')
url="http://www.apple.com/safari/"
license=('custom')
depends=()
makedepends=('subversion')
conflicts=('macfonts')
source=(
    "${pkgname}::svn+https://svn.code.sf.net/p/macbuntu/code/Macbuntu/fonts/"
    'http://images.apple.com/legal/sla/docs/SafariWindows.pdf'
)
md5sums=(
    'SKIP'
    '4886e440aac9586dd03445c76a2ccef1'
)
install='ttf-mac-fonts.install'

pkgver() {
        cd "${srcdir}"/"${pkgname}"
        LC_ALL=C svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d "${pkgdir}"/usr/share/fonts/{TTF,Type1}
	install -m644 gbk/*.ttf "${pkgdir}"/usr/share/fonts/TTF
	install -m644 mac/*.ttf "${pkgdir}"/usr/share/fonts/TTF
	install -m644 mac/*.pfb "${pkgdir}"/usr/share/fonts/Type1

	install -d "${pkgdir}"/usr/share/licenses/${pkgname}
	install -m644 "${srcdir}"/SafariWindows.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/
}
