# Maintainer: csicar
# Contributor: csicar
# Based on: https://github.com/yochananmarqos/pkgbuilds/blob/master/fx_cast-bin/PKGBUILD
pkgname=fx_cast-bin
pkgver=0.2.0
pkgrel=3
pkgdesc="Implementation of the Google Cast Chrome Sender SDK within Firefox "
arch=('x86_64')
url="https://hensm.github.io/fx_cast/"
license=('MIT')
depends=('avahi')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
install="${pkgname%-bin}.install"
source=("https://github.com/hensm/fx_cast/releases/download/v0.2.0/fx_cast_bridge-0.2.0-x64.deb"
        "https://raw.githubusercontent.com/hensm/fx_cast/v$pkgver/LICENSE")
sha512sums=('e8408663540d7474cb710f743263736ad02de36c2bc3c2546a2b15e022e75d5a192eb61786e59da11657a90e01e2f9f4564934b1ed11ecc85f048b174289d51d'
            '342096561c04ea9b85db0bb6f365bd448afbf7ce8f80e3dc35e26c303358b45bf6d19dc4e4bfbb20e52685fcfd8a650a27071387cdc4761a0365c66f427d8992')

package(){
	bsdtar -xvf data.tar.xz -C "$pkgdir"

	# Fix permissions
	find "$pkgdir/" -type d -exec chmod 755 {} \;
	chmod 644 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/${pkgname%-bin}_bridge.json"

	# Fix ownership
	chown -R root:root "${pkgdir}"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}