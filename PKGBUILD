# Maintainer: Johan Manuel <johan29.manuel at gmail dot com>
pkgname=tina-tpn
pkgver=3.7.5
pkgrel=1
pkgdesc="TIme Petri Net Analyzer"
arch=('x86_64')
url="http://projects.laas.fr/tina/home.php"
license=('unknown')
depends=(gmp graphviz)
options=(!strip)
source=("http://projects.laas.fr/tina/binaries/tina-$pkgver-amd64-linux.tgz")
md5sums=('4602148819224285835f4b6c3d2bc653')

package() {
	cd "tina-$pkgver"

	cd doc/man/mann
	for f in *.n; do
		mv -- "$f" "${f%.n}.1"
	done
	cd ../../..

	mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	cp -r $(find bin | grep -Ev 'dot|circo|neato') "$pkgdir/usr/bin"
	cp -r lib/libpol* "$pkgdir/usr/lib"
	cp -r doc/man/mann/* "$pkgdir/usr/share/man/man1"
}
