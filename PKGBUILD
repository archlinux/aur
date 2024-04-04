# Maintainer: nightuser <nightuser.android@gmail.com>
# Contributor: Antoine Pierlot-Garcin <antoine@bokbox.com>

pkgname=debsig-verify
pkgver=0.29
pkgrel=1
pkgdesc="Debian package signature verification tool"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://git.dpkg.org/git/dpkg/debsig-verify.git"
license=('GPL2')
depends=('dpkg' 'expat')
makedepends=()
source=("git+https://git.dpkg.org/git/dpkg/debsig-verify.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	./autogen
	./configure --prefix=/usr \
	            --sysconfdir=/etc
	make
}

check() {
	cd "${srcdir}/${pkgname}/test"
	make check-local
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
	install -m 0755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m 0644 doc/policy-syntax.txt doc/policy.dtd "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set noet sw=8 ts=8 tw=79:
