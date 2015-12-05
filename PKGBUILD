
pkgname="cntlm"
pkgver=0.92.3
pkgrel=4
license=('GPL2')
pkgdesc="An NTLM, NTLM2SR, and NTLMv2 authenticating HTTP proxy"
arch=('i686' 'x86_64')
url="https://github.com/bseb/cntlm"
source=('cntlm-0.92.3.tar.gz'
	    'cntlm.service')
backup=('etc/cntlm.conf')
md5sums=('0d7fcfbfbef0546306b896be246caa88'
		'3d0641122bef4ee93d5dfd8ec1a10230')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make \
		SYSCONFDIR="$pkgdir/etc" \
		BINDIR="$pkgdir/usr/bin" \
		MANDIR="$pkgdir/usr/share/man" \
		install
	install -Dm 644 "$srcdir/cntlm.service" "$pkgdir/usr/lib/systemd/system/cntlm.service"
}
