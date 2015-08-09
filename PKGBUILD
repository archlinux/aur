# Maintainer:  respiranto         <respiranto@icloud.com>
# Contributor: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Enrico Morelli     <morelli@cerm.unifi.it>
pkgname=dictd-foldoc
pkgver=20150731
pkgrel=3
pkgdesc="The Free On-line Dictionary of Computing for dict"
arch=('any')
url="http://foldoc.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
install=$pkgname.install
source=("http://foldoc.org/Dictionary.txt")
md5sums=('7086633cc91edacf4bfb7d47b2b431ab')

build()
{
	cat $srcdir/Dictionary.txt | dictfmt -f \
		--allchars -u http://foldoc.org/Dictionary.txt \
		-s "The Free On-line Dictionary of Computing ($pkgver)" \
		--utf8 foldoc
	dictzip -v foldoc.dict
}

package()
{
	mkdir -p $pkgdir/usr/share/dictd
	mv $srcdir/foldoc.{dict.dz,index} $pkgdir/usr/share/dictd/
}
