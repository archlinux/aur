# Maintainer: Hekuran Gashi <hekurangashi@pm.me>
# Contributor: Brandon 'Inco' Little <drinco@posteo.net>

pkgname=ssg
pkgver=6
pkgrel=1
pkgdesc='static site generator written on POSIX shell'
arch=('any')
license=('ISC')
depends=('lowdown' 'cpio')
url='https://www.romanzolotarev.com'
source=("${url}/bin/${pkgname}${pkgver}"
        "${url}/bin/Markdown.pl")
sha1sums=("53a8a94c50f4798434c05050606dd306cf9602f2"
          "3ff20882221ba2ea73fc11e640ee0c4e1fb39bbf")

build() {
	cd "$srcdir/$distdir"
	sed -n '/https:\/\/rgz.ee\/bin/,/OF THIS SOFTWARE./p' "${pkgname}${pkgver}" | sed -e 's/# //' -e 's/#//' > LICENSE
}

package() {
	cd "$srcdir/$distdir"
	install -d "$pkgdir"/usr/bin/
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	install -m755 "${pkgname}${pkgver}" "$pkgdir"/usr/bin/"${pkgname}"
	install -m755 Markdown.pl "$pkgdir"/usr/bin/Markdown.pl
	install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ts=4 sw=4
