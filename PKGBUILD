# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=opensmtpd-filter-dkimsign
pkgver=0.3.arch1
pkgrel=1
pkgdesc="opensmtd filter for signing mail with DKIM"
license=(BSD)
url="http://imperialat.at/dev/libopensmtpd/"
arch=(x86_64)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/filter-dkimsign/archive/v$pkgver.tar.gz"
	"https://distfiles.sigtrap.nl/libopensmtpd-0.5.tar.gz"
	"Makefile"
	"LICENSE"
)

depends=(openssl libevent)
makedepends=(gzip)

sha512sums=('9f9c80f403e5c42f27ff4a387121fdc865a3c0001086bf0ca9e213fcf079df82e5d48a7074ee27f114b1f226b3a04083bfa0e0667690a865545401658eb1faec'
            '4ca4fe1f30bc45246e70aa1489dcdfc6df9f75d07cdd5546aa35cdf25de61f0711743d249b4889cb3779487a3c2095ed51de100a9e1365f3dc3db70f984c27d6'
            'bafafa768ef8c8420f12fecf59f758085ff7ce497a861c36a284764bd41e552d12a837ec997813edb95fadef34b72fc8dfe281e03cd9d02c7662f72724e76bbc'
            '24ffeb515e767416728adf4f02aac9b6305447ff4ce8acdfb1ecb8321f76e261e5a536b20df9acec90542e3c3f30e259c0d11cd99d401eb154fd5faf89a6e125')

prepare() {
	ln -sf "filter-dkimsign-$pkgver" "filter-dkimsign"
	ln -sf "libopensmtpd-0.5" "libopensmtpd"
}

build() {
	make
	gzip -kf filter-dkimsign/filter-dkimsign.8
}

package() {
	install -m 755 -Dt "$pkgdir/usr/lib/smtpd/opensmtpd/" filter-dkimsign/filter-dkimsign
	install -m 644 -Dt "$pkgdir/usr/share/man/man8/" filter-dkimsign/filter-dkimsign.8.gz
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
