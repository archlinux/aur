# Maintainer: SZanko <szanko at protonmail dot com>
pkgname=rssg
pkgver=2
pkgrel=1
pkgdesc='rssg is an RSS feed generator written in shell.'

arch=('any')
license=('ISC')

url=https://www.romanzolotarev.com
sha256sums=('4f9622cafa955a6b79d30c5606a312c4552bf0620a4eda2b93e0f09c8e9228ab')
source=($url/bin/rssg)

build() {
        cd "$srcdir/$distdir"
        sed -n '/https:\/\/rgz.ee\/bin/,/OF THIS SOFTWARE./p' rssg | sed -e 's/# //' -e 's/#//' > LICENSE
		sed -i 's/ -j/-R/g' rssg
		sed '121d' rssg
		sed -i '120s/ \\//g' rssg
		sed -i 's/date_rfc_822 "$date"/date -R/g' rssg
		sed -i 's/date_rfc_822 date/date -R/g' rssg
		#sed -i 's/ %z//g' rssg
		#sed -i "s/| tr -cd '\[:digit:]')0000/)/g" rssg
}

package() {
        cd "$srcdir/$distdir"
        install -d "$pkgdir"/usr/bin/
        install -d "$pkgdir"/usr/share/licenses/$pkgname
        install -m755 rssg    "$pkgdir"/usr/bin/rssg
        install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

