# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=kelvpn
pkgver=7.7.67
pkgrel=1
pkgdesc="KelVPN is a decentralized quantum-secure VPN service. It provides the highest level of protection for your network connection, including quantum threat protection."
arch=('x86_64')
url="https://kelvpn.com/"
license=('custom')
provides=("kelvpn")
source=(https://pub.kelvpn.com/linux/master/KelVPN-7.7-67-amd64.deb)
sha256sums=('b719b5a6db926d15038693d060bd1373154982176be11e5062fc71b98a9df24e')
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
