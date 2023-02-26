# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-firefox
pkgver='0.4'
pkgrel=1
pkgdesc='Native messaging component for the Himitsu Firefox extension'
arch=(x86_64)
url='https://git.sr.ht/~sircmpwn/himitsu-firefox'
license=(GPL3)
depends=(himitsu)
makedepends=(hare hare-json)
install=himitsu-firefox.install
_extracted="$pkgname-$pkgver"
source=("$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0103d2e950b9efd3fcd120ab1b6bb838f8de427805b1da3176503a5ebd05d591')

build() {
	cd "$srcdir/$_extracted"
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	make PREFIX=/usr native/himitsu-firefox-native native/manifest.json
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install-native
}
