# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=chatzilla
pkgver=0.9.93
_pkgver=0_9_93
pkgrel=2
pkgdesc='Clean, easy to use and highly extensible Internet Relay Chat (IRC) client, built on the Mozilla platform'
arch=('any')
url='http://chatzilla.hacksrus.com/'
license=('MPL' 'GPL' 'LGPL')
depends=('xulrunner')
makedepends=('python2' 'unzip')
source=("$pkgname-$pkgver.tar.gz::http://hg.mozilla.org/chatzilla/archive/CHATZILLA_${_pkgver}_RELEASE.tar.gz"
        "xrmakeM.diff"
        "version.patch"
        "chatzilla.sh"
        "chatzilla.desktop")
sha256sums=('7c03e742fb6b8ec82f884464a1129ab4f644c74824963cd7d1ebddb9c8cc7523'
            '355ff3f351eb5c38a7e04bf2e83aa5f038f937753d7acb239fe0b0aef589c351'
            '43d3299ccf6f59d0123fc57d0affc8014d46650869c6edc251cd5cb54093ffa1'
            '0c6b2b68055f9c4e39e7e72a4ebfb3d4c13d439a30ca3ec8ed84109ceb16e8f1'
            '548e758a5334ea9e920fd8b21d29c0e4acd63bdd5f3c3b6eb6e5f5a79644f9cb')

prepare() {
	cd $pkgname-CHATZILLA_${_pkgver}_RELEASE
	patch -Np1 -i ../xrmakeM.diff
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
	install -Dm644 chatzilla-CHATZILLA_${_pkgver}_RELEASE/xpi/resources/chatzilla-window.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}
