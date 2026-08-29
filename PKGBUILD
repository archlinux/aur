# Maintainer: Ash <xash at riseup d0t net>
# Contributor: kryksyh <kryksyh@gmail.com>
pkgname=audacity4-bin
pkgver=4.0.0_beta.4
pkgrel=1
pkgdesc="Audacity 4 Beta (AppImage)"
arch=('x86_64')
url="https://github.com/audacity/audacity"
license=('GPL-3.0-or-later')
options=('!strip')
_tag_ver="${pkgver/_beta./-beta-}"
_appimage_ver="${pkgver/_beta./-beta}"
_appimage="Audacity-${_appimage_ver}-$CARCH.AppImage"
source=("${_appimage}::https://github.com/audacity/audacity/releases/download/Audacity-${_tag_ver}/${_appimage}"
        "${pkgname}.desktop")
sha256sums=('50d73009bcb59511f58ea047f7a99c58ecc9086c9747dd9b54e83019c014ae96'
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
