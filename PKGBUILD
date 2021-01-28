# Maintainer: csicar
# Contributor: csicar
# Based on: https://github.com/yochananmarqos/pkgbuilds/blob/master/fx_cast-bin/PKGBUILD
pkgname=fx_cast-bin
pkgver=0.1.0
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
source=("https://github.com/hensm/fx_cast/releases/download/v0.1.0/fx_cast_bridge-0.1.0-x64.deb"
        "https://raw.githubusercontent.com/hensm/fx_cast/v$pkgver/LICENSE")
sha512sums=('0cad784281f46c3b6d2818b3de8823afe6d935a2108ed6de3b06a28db20f0a751f530657c59c9cdc7235c6c3a0463a9d0f5d072c67a0081d029bb05116d14168'
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