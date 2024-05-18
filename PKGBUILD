# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=savilerow-bin
_pkgname=savilerow
pkgver=1.10.0
pkgrel=1
pkgdesc="A modelling assistant for Constraint Programming"
arch=('x86_64')
url="https://savilerow.cs.st-andrews.ac.uk/"
license=('custom')
depends=('java-runtime')
provides=('savilerow')
source=("$url/$_pkgname-$pkgver-linux.tgz"
	"savilerow.sh")
noextract=("savilerow.sh")
sha256sums=('3eedd957803ca783ef2e3a075408b4b029594a388ea0ae29c57651cc26c8836b'
            'a26d063017332f8aa2960fc4bd2713d3087f13ce1f9c29366f35135f26a43ffd')

package() {
	_licensedir="$pkgdir/usr/share/licenses/$pkgname"
	install -d "$pkgdir/opt" "$pkgdir/usr/share/licenses/$pkgname/vendored"

	cd "$srcdir"
	install -Dm0755 "savilerow.sh" "$pkgdir/usr/bin/savilerow"
	cp -r "$_pkgname-$pkgver-linux" "$pkgdir/opt/$_pkgname"

	cd "$_pkgname-$pkgver-linux"
	install -Dm 0644 COPYING "$_licensedir/COPYING"
	(cd "$_licensedir" && ln -sr COPYING LICENSE)
	install -Dm 0644 LICENSES/cadical/LICENSE "$_licensedir/vendored/cadical.txt"
	install -Dm 0644 LICENSES/chuffed/LICENSE "$_licensedir/vendored/chuffed.txt"
	install -Dm 0644 LICENSES/minion/LICENSE.txt "$_licensedir/vendored/minion.txt"
}
