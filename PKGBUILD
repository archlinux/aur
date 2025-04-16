# Maintainer: xiliuya <xiliuya@aliyun.com>

pkgname=v2ray-bin
pkgver=5.30.0
pkgrel=2
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
sha512sums=('6b1d9cf2c8c54aba71ff880e13544f33efb57f8621ee6b19081da7c73e99a131de19956f061d66e566cd6a68ae78eba801f5492b44559078307c07d5388fe6e4'
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
