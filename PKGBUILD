# Maintainer: SanskritFritz (gmail)

pkgname="cntlm"
pkgver=0.92.3
pkgrel=5
license=('GPL2')
pkgdesc="An NTLM, NTLM2SR, and NTLMv2 authenticating HTTP proxy."
arch=('i686' 'x86_64')
url="http://cntlm.sourceforge.net/"
source=("https://sourceforge.net/projects/cntlm/files/cntlm/cntlm%20$pkgver/cntlm-$pkgver.tar.gz"
	    'cntlm.service')
backup=('etc/cntlm.conf')
md5sums=('0d7fcfbfbef0546306b896be246caa88'
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
