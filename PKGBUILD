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
md5sums=("abf6c59327e7649a85cffaf95b904def"
         "7ec2474d8650b25bba541fb4b7c43186")

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
