# Contributor: FixFromDarkness <aur@forestfox.tk>
# Contributor: Asuka Minato

pkgname=microbin-bin
_pkgname=microbin
pkgver=2.0.4
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
sha256sums_i686=('55eb81cee9e9cffa128014db8259f6af89a9b55ba991cf7f34e2dc42d45b6e44')
sha256sums_x86_64=('ccfc69c5ab33cc79c56da0cea55e68a5b93f19fd68ac028a00e9d09bcf5575b6')
sha256sums_arm=('016e365fcde88aa7e0953c6f3974a2957780ac8d955be9decee44d91375e6446')
sha256sums_armv7h=('f9b7d5fa9abd028f123b7df0288a13d6378cbc02d03cd8888111d682314cfcb4')
sha256sums_aarch64=('03dfdc68e277296ca050fc4e3a83809d5e6167bf2da110efbe0cc00f58e0008a')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm644 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
	install -Dm644 $_pkgname.conf "$pkgdir"/etc/$_pkgname.conf
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	local _http_uid_gid=33
	install -do ${_http_uid_gid} -g ${_http_uid_gid} "$pkgdir"/var/lib/microbin/
}
