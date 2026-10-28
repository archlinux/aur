# Maintainer: ColtNovak <mail at coltnovak dot com>
pkgname=hyprcurtain
pkgver=1.0
pkgrel=1
pkgdesc='Stream Hyprland to Moonlight on a private headless output'
arch=('any')
url='https://github.com/ColtNovak/hyprcurtain'
license=('MIT')
depends=('hyprland' 'hyprlock' 'sunshine' 'jq' 'curl' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('029f784b742d9898c93606e0c68f0f4e07cfd67c69fa471e3c6ffc924ce17802')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 hyprcurtain "$pkgdir/usr/bin/hyprcurtain"
	install -Dm644 hyprcurtain.lua "$pkgdir/usr/share/lua/5.5/hyprcurtain.lua"
	install -Dm644 90-hyprcurtain.rules "$pkgdir/usr/lib/udev/rules.d/90-hyprcurtain.rules"
	sed 's|@BIN@|/usr/bin|' hyprcurtain.service | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/hyprcurtain.service"
	sed 's|@BIN@|/usr/bin|' sunshine-hyprcurtain.conf |
		install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/app-dev.lizardbyte.app.Sunshine.service.d/hyprcurtain.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
