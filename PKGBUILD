# Maintainer: Thilo Wischmeyer <thwischm@gmail.com>
pkgname=lesbar
pkgver=1.0.0
pkgrel=1
pkgdesc="A view layer for desktop widgets and statusbars"
arch=('x86_64')
url="https://git.sr.ht/~salmiak/lesbar"
license=('MIT')
depends=('cairo'
         'pango'
         'libx11')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~salmiak/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("05648b291bde08ec53d8e7b951c60ef079196acd54720a4ce3fa163d7f3e5c5e")

build() {
	cd "$pkgname-v$pkgver"
	GIT_CEILING_DIRECTORIES="$(realpath ..)" make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
