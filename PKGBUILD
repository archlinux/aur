# Maintainer: 3ED <krzysztof1987@gmail.com>
pkgname=qsp-bin
pkgver=5.7.0
pkgrel=5
pkgdesc="Quest Soft Player is a interactive fiction stories and games player (only for qsp format)"
arch=('i686' 'x86_64')
url="http://qsp.su/"
license=('GPL' 'LGPL')
depends=('qsp-common' 'libjpeg6-turbo' 'libpng12' 'gtk2' 'cairo' 'libsm')
_tarname="qsp${pkgver//\./}"

[ "$CARCH" = "x86_64" ] && _tarname="${_tarname}_64"

source=(
	"http://qsp.su/attachments/${_tarname}.tar.bz2"
	"qsp-qui.sh"
	"qsp-gui.desktop"
)
sha256sums=(
	'0d1f22209fd0ab39c64b8834634f599de16ac96cb03b30ab385ce57a5eb6022f'
	'ce1ebd984d333cf6ea052875c3c7573ad3837474859eb8a58c29466c9f549255'
	'd2a84ebbc0d2c40200781791f2a8a10d126bf93b053532377b872c3d723bc130'
)

[ "$CARCH" = "x86_64" ] && sha256sums[0]='0d1f22209fd0ab39c64b8834634f599de16ac96cb03b30ab385ce57a5eb6022f'

package() {
	install -dm755 "$pkgdir"/usr/{bin,lib/qsp,share/applications}
	install -m755 "$srcdir/qsp-qui.sh" "$pkgdir/usr/bin/qsp-gui"
	install -m644 "$srcdir/qsp-gui.desktop" "$pkgdir/usr/share/applications/"

	cd "$_tarname"
	bsdtar -cf - * | bsdtar -xf - -C "$pkgdir/usr/lib/qsp/"
}
