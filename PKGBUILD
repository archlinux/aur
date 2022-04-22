# Contributor: Simo Leone <leone.simo AT gmail DOT com>
pkgname=amtterm
pkgver=1.7
pkgrel=1
pkgdesc="Tools to connect to Intel AMT enabled machines via Serial-Over-LAN"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/blog/linux/$pkgname/"
license=('GPL2')
depends=('gnutls' 'perl' 'perl-soap-lite')
makedepends=('vte3')
optdepends=('vte3: for the gamt GUI')
source=("https://www.kraxel.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('8c58b76b3237504d751bf3588fef25117248a0569523f0d86deaf696d14294d4'
            'SKIP')
validpgpkeys=('A0328CFFB93A17A79901FE7D4CB6D8EED3E87138') # Gerd Hoffmann (work) <kraxel@redhat.com>

build() {
	cd "$pkgname-$pkgver"
	CFLAGS+=" $CPPFLAGS"
	make USE_GNUTLS=1
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" prefix=/usr install
}

# vim: set ft=sh ts=4 sw=4 noet:
