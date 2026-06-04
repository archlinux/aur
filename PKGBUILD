# Maintainer: Ash <xash at riseup d0t net>
pkgname=audacity4-bin
pkgver=4.0.0_beta.1
pkgrel=1
pkgdesc="Audacity 4 Beta (AppImage)"
arch=('x86_64')
url="https://github.com/audacity/audacity"
license=('GPL-3.0-or-later')
options=('!strip')
_upstream_ver="${pkgver/_/-}"
_appimage="Audacity-${_upstream_ver}-$CARCH.AppImage"
source=("${_appimage}::https://updates.audacityteam.org/feed/Audacity-${_upstream_ver}-$CARCH.AppImage"
        "${pkgname}.desktop")
sha256sums=('5312efa1ee3b11cf200978cd1ee8b456cdaf25d594659c697394bdf16be12e76'
            '1ceef3dd89868978070bf2e111f3eb6734795cece147d72ec2739e86c5c7d996')

package() {
	# Install AppImage
	install -Dm755 "$srcdir/${_appimage}" "$pkgdir/opt/$pkgname/audacity.AppImage"

	# Create /usr/bin symlink
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/audacity.AppImage" "$pkgdir/usr/bin/audacity4"

	# Install desktop file
	install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
