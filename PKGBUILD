pkgname=opensmtpd-filter-dkimsign
pkgver=0.2.arch2
pkgrel=1
pkgdesc="opensmtd filter for signing mail with DKIM"
url="http://imperialat.at/dev/libopensmtpd/"
arch=(x86_64)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/filter-dkimsign/archive/v$pkgver.tar.gz"
	"https://distfiles.sigtrap.nl/libopensmtpd-0.4.tar.gz"
	"Makefile"
)

depends=(openssl libevent)
makedepends=(gzip)

sha512sums=(
	'f91208fa1f9ae08c93fd6461b43a4176d40098eb2cdb3403cafdd91320088faadf3aea8df8e1cf4e8281ea3c40688b558813d274442c0ff88879f97aa2c0ad2f'
	'5f02a9ea5c8b099c244711ea7fcfaea61f1bd639656c17241b42824f6a966b9b42be25d2f05e0ec9272a0d49b71c6eebeef2a8b9e12f823770fca3a3d507b4aa'
	'0f048c58c75e2786af7f9e5300d9684554cf43a96dc7ee08163a1500bc5689b66ab36118aaf88db5b9d02630a5455ce73367cf2307e9add265ec50119c357298'
)

prepare() {
	ln -sf "filter-dkimsign-$pkgver" "filter-dkimsign"
	ln -sf "libopensmtpd-0.4" "libopensmtpd"
}

build() {
	make
	gzip -kf filter-dkimsign/filter-dkimsign.8
}

package() {
	install -m 755 -Dt "$pkgdir/usr/lib/smtpd/opensmtpd/" filter-dkimsign/filter-dkimsign
	install -m 644 -Dt "$pkgdir/usr/share/man/man8/"      filter-dkimsign/filter-dkimsign.8.gz
}
