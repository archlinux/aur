# Maintainer: Tanjiro Kamado <tanjiro.kamado at yandex dot com>
pkgname=timingeditor
_ccn=TimingEditor
pkgver=0.1
pkgrel=1
pkgdesc="The Timing Editor is a free tool to draw timing diagrams. "
arch=('x86_64')
url="http://timingeditor.sourceforge.net"
license=('GPL2')
depends=('wxgtk')
makedepends=()
source=("https://datapacket.dl.sourceforge.net/project/timingeditor/timingeditor/$pkgver/$_ccn-$pkgver-src.7z"
        "wx3.patch")
sha256sums=(
	'59c6f0c6c3c64394c187591d1eaefc97bdb440451935a16b2722ff91dea9952f'
	'95e4045e8bfa7422dc6eb7639d9c02b0961992b839cd7cd52d6a1f6e75a03b6b'
	)

prepare() {
	cd "$_ccn"
	patch -p1 -i "$srcdir/wx3.patch"
}

build() {
	cd "$_ccn"
	g++ *.cpp -DNDEBUG `wx-config --cxxflags --libs std,aui` -o $_ccn
}

package() {
	_base="$pkgdir/usr/bin"
	cd "$_ccn"
	mkdir -p "$_base/$_ccn"
	cp "$_ccn" "$_base/$_ccn/"
	rm -rf art/.svn
	cp -r art "$_base/$_ccn/"
	cd "$_base"
	ln -s "$_ccn/$_ccn" "$pkgname"
}
