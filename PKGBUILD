# Contributor: FixFromDarkness <aur@forestfox.tk>
# Contributor: Asuka Minato

pkgname=microbin-bin
_pkgname=microbin
pkgver=1.2.1
pkgrel=1
pkgdesc="A tiny, self-contained, configurable paste bin and URL shortener written in Rust."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/szabodanika/microbin"
license=('BSD')
provides=($_pkgname)
backup=('etc/microbin.conf')

source=("$_pkgname.service" "$_pkgname.conf"
	https://raw.githubusercontent.com/szabodanika/microbin/7da95d2d1183d44491ab1c5a489799606d03f963/LICENSE)
source_x86_64=("https://github.com/szabodanika/microbin/releases/download/v${pkgver}/microbin-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/szabodanika/microbin/releases/download/v${pkgver}/microbin-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/szabodanika/microbin/releases/download/v${pkgver}/microbin-v${pkgver}-i686-unknown-linux-musl.tar.gz")
source_armv7h=("https://github.com/szabodanika/microbin/releases/download/v${pkgver}/microbin-v${pkgver}-armv7-unknown-linux-musleabihf.tar.gz")
source_arm=("https://github.com/szabodanika/microbin/releases/download/v${pkgver}/microbin-v${pkgver}-arm-unknown-linux-musleabihf.tar.gz")
sha256sums=('3704d0a839585b6e6a38dda635f7c8119a3c8286420f62a028ae1b7d27a89ad0'
	'8e943fc702637b1b7441491db945c078d190c4208cd202e5e360cad90ca793ab'
	'f692f4e1ae51ae73723c06d826f2c11d03dcf2a0e84d41fabc74110dbcd0d591')
sha256sums_i686=('27485749be80f7ed33840a02a31264af3faad000f6279ca4c752b64286cdd842')
sha256sums_x86_64=('762a12295f032532c168328dfa040a24892ab8ee78aeff8992e2ac31c88d5269')
sha256sums_arm=('117bb442729513322b8ecf265495e7d8c88c98abc7606226b042da1eba77a2b4')
sha256sums_armv7h=('1987ef8a6fc7052bde80217e8ef73ff23d2ed7a21d2f1e9b315c906c2f78ad69')
sha256sums_aarch64=('e96c54cb3e5aab668f692b990f9fd897e6e30b28bbab04cee8a9e9cc6cd3e97c')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm644 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
	install -Dm644 $_pkgname.conf "$pkgdir"/etc/$_pkgname.conf
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	local _http_uid_gid=33
	install -do ${_http_uid_gid} -g ${_http_uid_gid} "$pkgdir"/var/lib/microbin/
}
