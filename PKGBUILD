# Maintainer: Daniel Boerlage <daniel.brlg@gmail.com>
pkgname=libnetica
pkgver=5.04
pkgrel=1
pkgdesc="Probabilistic graphical model software to work with Bayesian networks"
arch=('i686' 'x86_64')
url="norsys.com"
license=('custom')
depends=('glibc')
options=('!strip')
install=${pkgname}.install
source=(https://www.norsys.com/downloads/NeticaAPI_Linux_504.zip)
sha256sums=('56fc10c6eafbd6d2d82b41c6f1640704b0152b06014834eb815203d0a705f98e')

package() {
	cd "Netica_API_$pkgver"

	# install netica-c api
	install -d "$pkgdir"/opt/norsys/netica-c/
	cp -a * "$pkgdir"/opt/norsys/netica-c/

	# linking libnetica
	install -d "$pkgdir"/usr/lib/
	if [ "$CARCH" == "i686" ]; then
		ln -s /opt/norsys/netica-c/lib/libnetica.a "$pkgdir"/usr/lib/
	else
		ln -s /opt/norsys/netica-c/lib/64bit/libnetica.a "$pkgdir"/usr/lib/
	fi

	# linking header files
	install -d "$pkgdir"/usr/include/
	ln -s /opt/norsys/netica-c/src/{Netica.h,NeticaEx.h,NeticaCPP.h} "$pkgdir"/usr/include/

	# linking licence
	install -d "$pkgdir"/usr/share/licenses/libnetica
	ln -s /opt/norsys/netica-c/doc/LicAgree.txt "$pkgdir"/usr/share/licenses/libnetica/LICENSE

	# linking doc
	install -d "$pkgdir"/usr/share/doc/
	ln -s /opt/norsys/netica-c/doc/ "$pkgdir"/usr/share/doc/netica-c
}
