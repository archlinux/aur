# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-firefox
pkgver='0.9'
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
sha256sums=('319d763cb5d57f59850459b6efd5f75938f05a37e22382b3334391e0be8a9c10')

export HAREPATH='/usr/src/hare/stdlib:/usr/src/hare/third-party'

build() {
	cd "$srcdir/$_extracted"
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	make HARE=/usr/bin/hare PREFIX=/usr \
		native/himitsu-firefox-native native/manifest.json
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install-native
}
