# New maintainer: mxtm <max@mxtm.me>
# Many, many thanks to former maintainer and author of original PKGBUILD, ronnie
pkgname=mullvad
pkgver=56
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('unknown')
depends=('openvpn' 'resolvconf' 'python2' 'python2-appdirs' 'gksu' 'wxpython' 'obfsproxy' 'python2-ipaddr' 'python2-netifaces' 'python2-psutil' 'net-tools')
makedepends=()
conflicts=()
replaces=()
backup=()
install=

source=('https://mullvad.net/static/download/mullvad-'${pkgver}'.tar.gz'
		'update-resolv-conf'
)

sha256sums=('a3362fc62deb8a19e92b70c20e6c3a74301701a483ac02195c0570a4dff991ad'
			'6597e59d556efa3fcec73e8b0ea1c8fbee927cef9a283dadfe0f11149e34ede2'
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
