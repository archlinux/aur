# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=kelvpn
pkgver=7.7.90
pkgrel=1
pkgdesc="Decentralized quantum-secure VPN service. It provides the highest level of protection for your network connection, including quantum threat protection."
arch=('x86_64' 'aarch64')
url="https://kelvpn.com/"
license=('LicenseRef-custom')
provides=("kelvpn")
source_x86_64=(https://pub.kelvpn.com/linux/master/KelVPN-7.7-90-amd64.deb)
source_aarch64=(https://pub.kelvpn.com/linux/master/KelVPN-7.7-90-arm64.deb)
sha256sums_x86_64=('72bf88df644f97d3fdbc97f220ca5244c2e0b401271016469d86fb49d2dacbc9')
sha256sums_aarch64=('182016ef36d2dfc4ea912178c0b8dfd5a4d440a7421a04254ce0b3c6112666b9')
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
