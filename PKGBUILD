# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>
_pkgname=playit
pkgname=$_pkgname-bin
pkgver=0.16.4
pkgrel=1
pkgdesc="The playit program"
arch=('x86_64')
url="https://github.com/playit-cloud/playit-agent"
license=('BSD-2-Clause')
conflicts=(playit)
source=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_amd64.deb"
	"LICENSE.txt::https://raw.githubusercontent.com/playit-cloud/playit-agent/master/LICENSE.txt")
sha256sums=('b716061097333a463763a4ea523d71100bd3bfa80f2b489de1d7a30aa73d0758'
	'SKIP')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	mv "$pkgdir/lib/systemd" "$pkgdir/etc"
	rm -r "$pkgdir/lib"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
