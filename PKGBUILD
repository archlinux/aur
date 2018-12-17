# Maintainer: Kloenk <35c3@kloenk.de>
pkgname=35c3_char-dkms-git
pkgver=0.0.3r2
pkgrel=1
pkgdesc="Creates a char device with the content 35c3"
arch=('x86_64')
url="https://github.com/Kloenk/35c3_char"
license=('GPL')
groups=('kloenk')
depends=('dkms')
makedepends=('git')
provides=("35c3_char")
conflicts=("35c3_char")
replaces=()
backup=()
options=()
source=('35c3_char::git+https://github.com/Kloenk/35c3_char.git')
noextract=()
md5sums=('SKIP')

#pkgver() {
#	cd "$srcdir/${pkgname%-VCS}"
#}

package() {
	msg2 "Starting make install..."

	install -Dm644 "$srcdir/35c3_char/dkms.conf" "$pkgdir/usr/src/35c3_char-${pkgver}/dkms.conf"

	# Set name and version
	sed -e "s/@_PKGBASE@/35c3_char/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/35c3_char-${pkgver}/dkms.conf

	# installing source
	cd "$srcdir/35c3_char"
	install -Dm644 35c3.c "$pkgdir/usr/src/35c3_char-${pkgver}/35c3.c"
	install -Dm644 35c3.h "$pkgdir/usr/src/35c3_char-${pkgver}/35c3.h"
	install -Dm644 Makefile "$pkgdir/usr/src/35c3_char-${pkgver}/Makefile"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
