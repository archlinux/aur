# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>
_pkgname=playit
pkgname=$_pkgname-bin
pkgver=0.16.3
pkgrel=1
pkgdesc="The playit program"
arch=('x86_64')
url="https://github.com/playit-cloud/playit-agent"
license=('BSD-2-Clause')
conflicts=(playit)
source=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_amd64.deb"
	"LICENSE.txt::https://raw.githubusercontent.com/playit-cloud/playit-agent/master/LICENSE.txt")
sha256sums=('2bc1b4923ccbc46f6e67f100c9ec067dc6f44c2f1197fd8a39f126e7372c4716'
	'SKIP')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	mv "$pkgdir/lib/systemd" "$pkgdir/etc"
	rm -r "$pkgdir/lib"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
