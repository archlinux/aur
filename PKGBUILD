# Maintainer: Teakov <thomaskovac at gmail.com>
pkgname="uhasselt-print-canon"
pkgver="1.0"
pkgrel=1
pkgdesc="CUPS driver for the Canon iR ADV C5540i"
url="https://www.canon-europe.com/support/products/imagerunner/imagerunner-advance-c5045.aspx?type=drivers&language=EN&os=LINUX"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('cups')
makedepends=('p7zip')

source=(
	data.dmg::'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNzU4MjA4&cmp=ABX&lang=EN'
)

sha512sums=(
	'59f17c45e99cec7399aa916b90fee99fbac8269712e3fdbaf9789fe6fa890d6736a13f6c47c0051db4c72f30c4a27ff170d99255ccabc71f878eaea648596294'
)

prepare() {
	7z e data.dmg -o$srcdir/data
}

package() {
  cd "$srcdir/data"
	install -d -m755 ${pkgdir}/usr/share/cups/model/Canon
	install -d -m755 ${pkgdir}/usr/share/ppd/Canon
  install -D -m644 *.PPD.gz ${pkgdir}/usr/share/cups/model/Canon
  install -D -m644 *.PPD.gz ${pkgdir}/usr/share/ppd/Canon
}
