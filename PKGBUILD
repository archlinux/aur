# Maintainer: alicewww <aliceweigt@gmail.com>
# Co-Maintainer: None
# This package is maintained using the assistance of PKGBUILD-Updater (available on github)
pkgname=mullvad
pkgver=66
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('GPLv2')
depends=('openvpn' 'resolvconf' 'python2' 'python2-appdirs' 'gksu' 'wxpython=3.0.2.0-5' 'python2-setuptools' 'python2-ipaddr' 'python2-netifaces' 'python2-psutil' 'net-tools')
makedepends=()
conflicts=()
replaces=(mullvad-new)
backup=()
install=
 
source=('https://mullvad.net/media/client/mullvad-'$pkgver'.tar.gz'
 		'update-resolv-conf'
 )

sha256sums=('1d14dc8864f61a5b46e8c5714ae6b6c30da416b7d52f37ca14a16d961cae701a'
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
