# Maintainer: alicewww <aliceweigt@gmail.com>
# Co-Maintainer: None
# This package is maintained using the assistance of PKGBUILD-Updater (available on github)
pkgname=mullvad-old
pkgver=67
pkgrel=1
pkgdesc="Old VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('GPLv2')
depends=('openvpn' 'resolvconf' 'python2' 'python2-appdirs' 'gksu' 'wxpython' 'python2-setuptools' 'python2-ipaddr' 'python2-netifaces' 'python2-psutil' 'net-tools')
makedepends=()
conflicts=(mullvad-new)
replaces=()
backup=()
install=
 
source=('https://mullvad.net/media/client/mullvad-'$pkgver'.tar.gz'
 		'update-resolv-conf' 'mullvad.patch'
 )

sha256sums=('26f8ed908dbf29f5a6d51296cfe81686c0ad395e56ff8aa5019d398a73a948c1'
			'7227dfd75d03ba90c1e45cda41e5ba5a938729b622ced4a708932b22c189efa1'
            'e797b20d69d20d353bbfca126c5c6c7766a2eda2b4f7266ad888d556214ea973'
)

prepare() {
	cd $pkgname-$pkgver
	chmod +x setup.py
    patch -p1 -i "${srcdir}/mullvad.patch"
}

build() {
	cd $pkgname-$pkgver
	python2 setup.py build

}

package() {
	cd $pkgname-$pkgver
	python2 setup.py install --root "$pkgdir/"

	mkdir -p $pkgdir/etc/openvpn
	cp ../update-resolv-conf $pkgdir/etc/openvpn/
	chmod +x $pkgdir/etc/openvpn/update-resolv-conf
}
