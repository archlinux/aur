# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=chatzilla
pkgver=0.9.92
_pkgver=0_9_92
pkgrel=1
pkgdesc='Clean, easy to use and highly extensible Internet Relay Chat (IRC) client, built on the Mozilla platform'
arch=('any')
url='http://chatzilla.hacksrus.com/'
license=('MPL' 'GPL' 'LGPL')
depends=('firefox')
makedepends=('python2' 'unzip')
source=("$pkgname-$pkgver.tar.gz::http://hg.mozilla.org/chatzilla/archive/CHATZILLA_${_pkgver}_RELEASE.tar.gz"
        "http://chatzilla.rdmsoft.com/xulrunner/patch/xrmakeM.diff.txt"
        "version.patch"
        "chatzilla.sh"
        "chatzilla.desktop")
sha256sums=('aa61fd08f587bae6b9410216f2995ec4785f2a114630344a7204240d6fe89ec7'
            'f56421321bad60513a6b2855119fd8ee0cee65525b8463c265d810b16bf5c229'
            '43d3299ccf6f59d0123fc57d0affc8014d46650869c6edc251cd5cb54093ffa1'
            '0cf6529326def9bbff73b04f9abd45193c41ca3c8b44dd922739c3f969701a59'
            '548e758a5334ea9e920fd8b21d29c0e4acd63bdd5f3c3b6eb6e5f5a79644f9cb')

prepare() {
	cd $pkgname-CHATZILLA_${_pkgver}_RELEASE
	patch -Np1 -i ../xrmakeM.diff.txt
	patch -Np1 -i ../version.patch
}

build() {
	cd $pkgname-CHATZILLA_${_pkgver}_RELEASE/xpi
	python2 makexpi.py
}

package() {
	install -dm755 "$pkgdir/usr/share/chatzilla"
	unzip $pkgname-CHATZILLA_${_pkgver}_RELEASE/xpi/$pkgname-$pkgver.en-US.xulapp -d "$pkgdir/usr/share/$pkgname"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 chatzilla-CHATZILLA_0_9_92_RELEASE/xpi/resources/chatzilla-window.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}
