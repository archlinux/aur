# Maintainer: Arne Ludwig < arne.ludwig at posteo dot de >
# Maintainer: Szymon Scholz < szymonscholz at gmail dot com >
# Contributor: Jo De Boeck <deboeck.jo@gmail.com>
# Original Maintainer: Julien Humbert <julroy67@gmail.com>
# Contributor: danyf90
# Contributor: hermes14
pkgname=superbeam
pkgver=5.1.3
pkgrel=2
pkgdesc="The easiest and fastest way to share files with Android"
arch=('any')
url="http://superbe.am/"
license=('custom')
depends=('java-environment' 'java8-openjfx' 'bash')
makedepends=('gendesk')
source=(http://superbe.am/download/5319)

prepare(){
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="SuperBeam" --categories="Network"
	sed -E '/^exec / {
		i \
cd /usr/share/superbeam
	}' \
		< "$srcdir/SuperBeam-${pkgver}-linux/SuperBeam-${pkgver}-linux.sh" \
		> "$srcdir/SuperBeam-${pkgver}-linux/SuperBeam-${pkgver}-linux.ssl-proxy-fix.sh"
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/SuperBeam-${pkgver}-linux/SuperBeam-${pkgver}-linux.ssl-proxy-fix.sh" "$pkgdir/usr/bin/superbeam"
	install -Dm755 "$srcdir/SuperBeam-${pkgver}-linux/ssl-proxy" "$pkgdir/usr/share/superbeam/ssl-proxy"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/SuperBeam-${pkgver}-linux/SuperBeam.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/SuperBeam-${pkgver}-linux/README" "$pkgdir/usr/share/doc/$pkgname/README"
}

sha256sums=('0b30f4dfbfd5161ebe721874f8c3d669345be12fc2c656ed1cba670fbe532a75')
