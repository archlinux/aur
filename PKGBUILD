# Maintainer: Daniel Weiland <daniel@weilxnd.com>
pkgname=ralcgm
pkgver=3.50
pkgrel=1
_commit=b0df1327b0eb18af71945f459fb209d6f4737c1d
pkgdesc="Interpret Computer Graphics Metafiles"
arch=('x86_64')
url="http://www.agocg.ac.uk/train/cgm/ralcgm.htm"
license=('custom')
depends=()
makedepends=('cmake')
source=("$pkgname-$pkgver::git+https://github.com/flaviut/ralcgm#commit=$_commit"
	"LICENSE")
sha256sums=('SKIP'
            '9c136c9a4ffd4c1a5c208a938e01f1556f50fdcc48edfb0a498fa7a8f4289eb2')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake ..
	make
}

package() {
	install -Dm644 "$pkgname-$pkgver/docs/${pkgname}.man" "${pkgdir}/usr/share/man/man7/${pkgname}.7"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
