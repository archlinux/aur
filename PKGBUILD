# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>
_pkgname=playit
pkgname=$_pkgname-bin
pkgver=0.15.13
pkgrel=1
pkgdesc="The playit program"
arch=('x86_64')
url="https://github.com/playit-cloud/playit-agent"
license=('BSD-2-Clause')
conflicts=(playit)
source=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_amd64.deb"
	"LICENSE.txt::https://raw.githubusercontent.com/playit-cloud/playit-agent/master/LICENSE.txt")
sha256sums=('fa69110d73b85c203337fb4b182b6dfae12d8148246efb2a05455e966174eb2c'
            'SKIP')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	mv "$pkgdir/lib/systemd" "$pkgdir/etc"
	rm -r "$pkgdir/lib"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
