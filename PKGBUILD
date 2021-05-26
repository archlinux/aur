# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=opensmtpd-filter-dkimsign
pkgver=0.5.pre
_pkgver=0.5
pkgrel=1
pkgdesc="opensmtd filter for signing mail with DKIM"
license=(BSD)
url="http://imperialat.at/dev/libopensmtpd/"
arch=(x86_64)
source=(
	"https://distfiles.sigtrap.nl/filter-dkimsign-$_pkgver.tar.gz"
	"LICENSE"
)

depends=(libopensmtpd openssl)
makedepends=(gzip)

sha512sums=(
	'35293bc51c6026c6846952ddf3a0fc92c99c88e9a573676e3e46034761318f32fe86563c2607175909c331ff0c1e2e6603173e286574a922528eae92bf6a4064'
	'24ffeb515e767416728adf4f02aac9b6305447ff4ce8acdfb1ecb8321f76e261e5a536b20df9acec90542e3c3f30e259c0d11cd99d401eb154fd5faf89a6e125'
)

build() {
	export CFLAGS="$CFLAGS -I/usr/include/libopensmtpd"
	cd filter-dkimsign-$_pkgver
	make -f Makefile.gnu
	gzip -kf filter-dkimsign.8
}

package() {
	install -m 755 -Dt "$pkgdir/usr/lib/smtpd/opensmtpd/" filter-dkimsign-$_pkgver/filter-dkimsign
	install -m 644 -Dt "$pkgdir/usr/share/man/man8/" filter-dkimsign-$_pkgver/filter-dkimsign.8.gz
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
