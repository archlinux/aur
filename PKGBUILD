# Maintainer: xiliuya <xiliuya@aliyun.com>

pkgname=v2ray-bin
pkgver=5.39.0
pkgrel=1
pkgdesc="A platform for building proxies to bypass network restrictions"
arch=('x86_64')
url="https://github.com/v2fly/v2ray-core"
license=('MIT')
provides=('v2ray')
conflicts=('v2ray' 'v2ray-geoip' 'v2ray-domain-list-community')
depends=('glibc')
options=('!debug')
source=("${pkgname%-bin}_${pkgver}.zip::https://github.com/v2fly/v2ray-core/releases/download/v${pkgver}/v2ray-linux-64.zip"
	LICENSE)
sha512sums=('1596b36ea585354ff1470a7bb775ff8ad913f3b481ea253afd9a7fe62789d7553a38815bbb64450b89e2e7f7b4546a585b2a4eb33ce69afa5c85b037c6e7f7e4'
	'866fed989ae66146085718c7d12dcff81de0e3f6be426a8407ddf8c7da4dc68f71e3ff1324621a25e8f6edfdad3fc6ff2e6f72971731a0ff248a35808a6599c9')

package() {
	cd "$srcdir"
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/v2ray/
	install -Dm644 systemd/system/v2ray.service -t "$pkgdir"/usr/lib/systemd/system/
	install -Dm644 systemd/system/v2ray@.service -t "$pkgdir"/usr/lib/systemd/system/
	install -Dm644 *.json -t "$pkgdir"/etc/v2ray/
	install -Dm755 v2ray -t "$pkgdir"/usr/bin/

	# install geoip
	install -Dm644 geoip.dat "$pkgdir"/usr/share/v2ray/geoip.dat

	# install v2ray-domain-list-community
	install -Dm644 geosite.dat "$pkgdir"/usr/share/v2ray/geosite.dat
}
