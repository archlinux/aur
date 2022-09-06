# Maintainer: csicar
# Contributor: csicar
# Based on: https://github.com/yochananmarqos/pkgbuilds/blob/master/fx_cast-bin/PKGBUILD
pkgname=fx_cast-bin
pkgver=0.3.0
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
source=("https://github.com/hensm/fx_cast/releases/download/v0.3.0/fx_cast_bridge-0.3.0-x64.deb"
        "https://raw.githubusercontent.com/hensm/fx_cast/v$pkgver/LICENSE")
sha512sums=('1b5952fd7443fdaba77f1f46feab80c621994b94305361cbd590431db9244a950c90adba1458ff6b61e7374c70bb652a8c53db7aa7280260cff2c8e496c5fbc2'
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