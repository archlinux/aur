# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain.org>

pkgname=tpm2-abrmd
pkgver=2.0.1
pkgrel=1
pkgdesc='TPM2 Access Broker & Resource Manager'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-abrmd'
license=('BSD')
depends=('glib2' 'dbus' 'tpm2-tss')
source=("https://github.com/tpm2-software/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc}
        "tss.sysusers")
sha256sums=('b012a6c3e4462a411eaafd3dc8d3b13ef4118348acfd5108b68a57c8c0a5ed9c'
            'SKIP'
            '67d89be143dc129a95b0c1a42b3e92367a151289fb6c0655c054fccd62cd9a0e')
validpgpkeys=('42007E876F248E04A3F2FE25AE4548D043DEC7C3')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --disable-static --with-pic
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir"
	install -Dm644 "tss.sysusers" "$pkgdir/usr/lib/sysusers.d/tss.conf"
}
