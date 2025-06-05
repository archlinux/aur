# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=kelvpn
pkgver=7.7.88
pkgrel=1
pkgdesc="Decentralized quantum-secure VPN service. It provides the highest level of protection for your network connection, including quantum threat protection."
arch=('x86_64')
url="https://kelvpn.com/"
license=('LicenseRef-custom')
provides=("kelvpn")
source=(https://pub.kelvpn.com/linux/master/KelVPN-7.7-88-amd64.deb)
sha256sums=('be3f6a32f41bf9473186718a2b573a74a736bdad58cc7d2b51d35de560ce9fd9')
install=$pkgname.install
options=(!debug)
depends=(fontconfig freetype2 libgl libpng libx11 libxcb libxrandr networkmanager xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm zlib net-tools)

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	mkdir -p "$pkgdir"/usr/bin
	chmod -R 755 "$pkgdir/opt/$pkgname/bin"
	ln -sf "$pkgdir/opt/$pkgname/bin/KelVPN" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$pkgdir/opt/$pkgname/share/KelVPN.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm 644 "$pkgdir/opt/$pkgname/share/KelVPNService.service" -t "$pkgdir/usr/lib/systemd/system/"
}
