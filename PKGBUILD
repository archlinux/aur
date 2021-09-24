# Maintainer: Thilo Wischmeyer <thwischm@gmail.com>
pkgname=lesbar
pkgver=0.5
pkgrel=3
pkgdesc="A view layer for desktop widgets and statusbars"
arch=('x86_64')
url="https://git.sr.ht/~salmiak/lesbar"
license=('MIT')
depends=('cairo'
         'glib2'
         'pango'
         'libx11')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~salmiak/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("1eb6419de61ce653c2941845797489f15fe851ffee3ff3630fe54f24d7500289")

build() {
	cd "$pkgname-v$pkgver"
	GIT_CEILING_DIRECTORIES="$(realpath ..)" make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
