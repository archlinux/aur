# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: <jnbek1972@gmail.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Erus <erus.iluvatar@gmail.com>

pkgname=ttf-mac-fonts
pkgver=20100901.134
pkgrel=1
pkgdesc='Mac fonts including Lucida Grande, Apple Garamond and other fonts from Apple'
arch=('any')
url='https://www.apple.com/safari/'
license=('custom')
depends=()
makedepends=('subversion')
conflicts=('macfonts')
source=("$pkgname::svn+https://svn.code.sf.net/p/macbuntu/code/Macbuntu/fonts/"
        'http://images.apple.com/legal/sla/docs/SafariWindows.pdf')
sha256sums=('SKIP'
            'd1c9697ea430a3ddad6548c7b9c961c4b06f9da5a5ba1f1007fe998b3354df4a')

pkgver() {
    cd "$pkgname"
    LC_ALL=C svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

package() {
	cd "$pkgname"
	install -d "$pkgdir"/usr/share/fonts/{TTF,Type1}
	install -m644 gbk/*.ttf "$pkgdir"/usr/share/fonts/TTF
	install -m644 mac/*.ttf "$pkgdir"/usr/share/fonts/TTF
	install -m644 mac/*.pfb "$pkgdir"/usr/share/fonts/Type1

	install -d "$pkgdir"/usr/share/licenses/"$pkgname"
	install -m644 "$srcdir"/SafariWindows.pdf "$pkgdir"/usr/share/licenses/"$pkgname"/
}
