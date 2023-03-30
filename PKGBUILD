# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-firefox
pkgver='0.4'
pkgrel=2
pkgdesc='Native messaging component for the Himitsu Firefox extension'
arch=(x86_64)
url='https://git.sr.ht/~sircmpwn/himitsu-firefox'
license=(GPL3)
depends=(himitsu)
makedepends=(hare hare-json)
install=himitsu-firefox.install
_extracted="$pkgname-$pkgver"
source=("$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8d2ac3b8ce1b1ce1f05b92668da10b194293c36a2d39f29f74bfe8579a7b6a0f')

build() {
	cd "$srcdir/$_extracted"
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	make PREFIX=/usr native/himitsu-firefox-native native/manifest.json
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install-native
}
