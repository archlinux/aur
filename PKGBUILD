# New maintainer: alicewww <aliceweigt@gmail.com>
# Many, many thanks to former maintainer and author of original PKGBUILD, ronnie
#and many thanks to the previous maintainer mxtm
pkgname=mullvad
pkgver=61
pkgrel=2
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('GPLv2')
depends=('openvpn' 'resolvconf' 'python2' 'python2-appdirs' 'gksu' 'wxpython' 'obfsproxy' 'python2-ipaddr' 'python2-netifaces' 'python2-psutil' 'net-tools')
makedepends=()
conflicts=()
replaces=(mullvad-new)
backup=()
install=
 
source=('https://mullvad.net/download/latest/source'
		'update-resolv-conf'
)

sha256sums=('42afd6e583120ee3d55419ece4dc7324bba23811a1e3a8db8d72166f548d3b38'
			'7227dfd75d03ba90c1e45cda41e5ba5a938729b622ced4a708932b22c189efa1'
)

prepare() {
	cd mullvad-$pkgver
	chmod +x setup.py
}

build() {
	cd mullvad-$pkgver
	python2 setup.py build

}

package() {
	cd mullvad-$pkgver
	python2 setup.py install --root "$pkgdir/"

	mkdir -p $pkgdir/etc/openvpn
	cp ../update-resolv-conf $pkgdir/etc/openvpn/
	chmod +x $pkgdir/etc/openvpn/update-resolv-conf
}
