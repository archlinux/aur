# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-firefox
pkgver='0.6'
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
sha256sums=('8c241551dcc466c0faac01f528653a18dadf50baacb869731addd1112c27bec2')

build() {
	cd "$srcdir/$_extracted"
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	export HAREPATH='/usr/src/hare/stdlib:/usr/src/hare/third-party'
	make HARE=/usr/bin/hare PREFIX=/usr \
		native/himitsu-firefox-native native/manifest.json
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install-native
}
