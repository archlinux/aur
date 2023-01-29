# Maintainer: Thilo Wischmeyer <thwischm@gmail.com>
pkgname=lesbar
pkgver=1.1.0
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
sha256sums=("1a3fbea96d9f2eba7f473542dfa6b65d21edc749e60564f072742c5a7a113c17")

build() {
	cd "$pkgname-v$pkgver"
	GIT_CEILING_DIRECTORIES="$(realpath ..)" make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
