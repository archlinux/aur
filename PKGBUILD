# Maintainer: nightuser <nightuser.android@gmail.com>
# Contributor: Antoine Pierlot-Garcin <antoine@bokbox.com>

pkgname=debsig-verify
pkgver=0.22
pkgrel=1
pkgdesc="Debian package signature verification tool"
arch=('x86_64')
url="https://git.dpkg.org/git/dpkg/debsig-verify.git"
license=('GPL2')
depends=('dpkg' 'expat')
makedepends=()
source=("http://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=("cb064c0d369522eca595ebdcd22940bc71e62a6605ededfb48e20f70eae08c94")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen
	./configure --prefix=/usr \
	            --sysconfdir=/etc
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/test"
	make check-local
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -m 0755 -d "$pkgdir/usr/share/doc/$pkgname"
	install -m 0644 doc/policy-syntax.txt doc/policy.dtd "$pkgdir/usr/share/doc/$pkgname"
}

# vim: set noet sw=8 ts=8 tw=79:
