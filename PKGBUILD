# Maintainer: Daniel Boerlage <daniel.brlg@gmail.com>
pkgname=netica
pkgver=5.19
pkgrel=1
pkgdesc="Probabilistic graphical model software for editing, learning from data, and computation with Bayesian networks"
arch=('any')
url="norsys.com"
license=('custom:netica license')
depends=('wine')
install=${pkgname}.install
source=(netica32 netica64 https://www.norsys.com/downloads/Netica_Win_519.zip)
sha256sums=('24141601057f66352e2b0e76e4723f9412fa3e261efd55e647126e382f153155'
            '31c60a2af0520a121161b66d4a1fa0e7c055766130bf63682aab06fb8c6a50dd'
            '675bfbee41c400d1797f28d16f917231604efa658f99a57870bedbf32b4cea28')

package() {
	# install netica-app
	install -d "$pkgdir"/opt/norsys/netica/
	cp -a "Netica 519"/* "$pkgdir"/opt/norsys/netica/

	# installing netica launcher
	install -d "$pkgdir"/usr/bin/
	if [ "$CARCH" == "i686" ]; then
		install -m755 netica32 "$pkgdir"/usr/bin/netica
    else
		install -m755 netica64 "$pkgdir"/usr/bin/netica
	fi

	# linking licence
	install -d "$pkgdir"/usr/share/licenses/netica
	ln -s '/opt/norsys/netica/License Agreement.pdf' "$pkgdir"/usr/share/licenses/netica/LICENSE.pdf
}
