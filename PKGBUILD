# Maintainer: X0rg

pkgname=gns3-legacy
pkgver=0.8.7
_pkgver="GNS3-$pkgver"
pkgrel=1
pkgdesc='GNS3 network simulator: code before v1.0'
arch=('any')
url='https://github.com/GNS3/gns3-legacy'
license=('GPL2')
makedepends=('python-setuptools')
depends=('qt4>=4.5.1' 'python2>=2.6' 'sip>=4.5' 'python2-sip>=4.5' 'python2-pyqt4>=4.5')
optdepends=('dynamips: Cisco router emulator.'
            'wireshark-gtk: Live packet capture.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GNS3/$pkgname/archive/$_pkgver.tar.gz"
        'gns3.desktop')
sha512sums=('7c4372845017b7472a85b95407fe845366e857955b2e658999a6ba0e38ae5d97ccc4a4271fe45b5601267efce3e3a4602305613a365078710343068e3699391f'
            '999a5091c8b789c53f04fa071be8753fb8609d2a4282ca5b3f9a5329dfaf4dfa54eb739f543133d89c85a0dd9159e4bc846f7f7657a9c8b8b2b5953dfb445771')

prepare() {
	cd "$srcdir/$pkgname-$_pkgver"
	sed -i 's|/usr/local/share|/usr/share|g' setup.py
	sed -i 's|/usr/share/examples/gns3/|/usr/share/gns3/|' setup.py
}

build() {
	cd "$srcdir/$pkgname-$_pkgver"
	python2.7 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$_pkgver"
	python2.7 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 "gns3.icns" "$pkgdir/usr/share/pixmaps/gns3.png"
	install -Dm644 "$srcdir/gns3.desktop" "$pkgdir/usr/share/applications/gns3.desktop"
	rm -rf "$pkgdir/usr/share/doc"
}
