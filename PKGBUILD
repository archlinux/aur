# Maintainer: SanskritFritz (gmail)

pkgname=cntlm
pkgver=0.94.0
pkgrel=1
license=('GPL2')
pkgdesc="An NTLM, NTLM2SR, and NTLMv2 authenticating HTTP proxy."
arch=('i686' 'x86_64')
url="https://github.com/versat/cntlm"
source=("https://github.com/versat/cntlm/archive/refs/tags/$pkgver.tar.gz"
	    'cntlm.service')
backup=('etc/cntlm.conf')
md5sums=('9aa6873d9e9cbaf59e3f6b0b51ec114c'
         '3d0641122bef4ee93d5dfd8ec1a10230')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make \
		SYSCONFDIR="$pkgdir/etc" \
		BINDIR="$pkgdir/usr/bin" \
		MANDIR="$pkgdir/usr/share/man" \
		install
	install -Dm 644 "$srcdir/cntlm.service" "$pkgdir/usr/lib/systemd/system/cntlm.service"
}
