# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>
_pkgname=playit
pkgname=$_pkgname-bin
pkgver=0.15.23
pkgrel=1
pkgdesc="The playit program"
arch=('x86_64')
url="https://github.com/playit-cloud/playit-agent"
license=('BSD-2-Clause')
conflicts=(playit)
source=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_amd64.deb"
	"LICENSE.txt::https://raw.githubusercontent.com/playit-cloud/playit-agent/master/LICENSE.txt")
sha256sums=('f4ab4a8ed6b257e50f5eee32a7c1c4bbe5cacde797a0c34a26d8601e4eb829c4'
	'SKIP')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	mv "$pkgdir/lib/systemd" "$pkgdir/etc"
	rm -r "$pkgdir/lib"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
