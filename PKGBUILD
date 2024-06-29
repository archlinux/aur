# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=kelvpn
pkgver=$(curl --silent 'https://pub.kelvpn.com/linux/master/latest/' | grep -oP 'KelVPN-\K\d+.\d+\-\d+' | tr '-' '.')
pkgrel=2
pkgdesc="KelVPN is a decentralized quantum-secure VPN service. It provides the highest level of protection for your network connection, including quantum threat protection."
arch=('x86_64')
url="https://kelvpn.com/"
license=('custom')
provides=("kelvpn")
source=(https://pub.kelvpn.com/linux/master/KelVPN-7.6-6-amd64.deb)
sha256sums=('SKIP')
install=$pkgname.install
options=(!debug)
depends=(fontconfig freetype2 libgl libpng libx11 libxcb libxrandr networkmanager xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm zlib net-tools)

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod -R 755 "$pkgdir/opt/$pkgname/bin"
	install -Dm 755 "$pkgdir/opt/$pkgname/bin/KelVPN" "$pkgdir/usr/localbin/$pkgname"
	install -Dm 644 "$pkgdir/opt/$pkgname/share/KelVPN.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm 644 "$pkgdir/opt/$pkgname/share/KelVPNService.service" -t "$pkgdir/usr/lib/systemd/system/"
}
