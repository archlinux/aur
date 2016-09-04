# Maintainer:  Alad Wenter <alad (at) archlinux.info>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
# Contributor: C. Dominik Bódi <dominik.bodi@gmx.de>
# Contributor: Pierre Carrier <pierre@spotify.com>
# Contributor: Thomas Dziedzic <gostrc (at) gmail>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: seblu <seblu+arch (at) seblu.net>
# Contributor: squiddo <squiddo (at) intheocean.net>
# Contributor: dront78 <dront78 (at) gmail.com>
# Contributor: hugelgupf <ckoch (at) cs.nmt.edu>

pkgname=dpkg
pkgver=1.18.10
pkgrel=2
pkgdesc="The Debian Package Manager.  Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="http://packages.debian.org/dpkg"
license=('GPL')
depends=('xz' 'zlib' 'bzip2' 'perl')
makedepends=('perl-io-string' 'perl-timedate')
source=("http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver"{.tar.xz,.dsc})
sha256sums=('025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5'
'SKIP')
#validpgpkeys=(4F3E74F436050C10F5696574B972BF3EA4AE57A3)

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--disable-start-stop-daemon \
		--disable-install-info
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	install -d "$pkgdir/var/$pkgname"/updates/
	touch "${pkgdir}/var/lib/$pkgname"/{status,available}
}
