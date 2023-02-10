# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Bastian Germann <bastian.germann[at]gmx[dot]de>
# Contributor: hcartiaux
# Contributor: Chris Mann <cshclm[at]gmail[dot]com>

pkgname=unrar-free
pkgver=0.1.3
pkgrel=4
epoch=1
pkgdesc="Free utility to extract files from RAR archives."
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/bgermann/unrar-free"
license=('GPL')
depends=('libarchive')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('35840fe474d7139a4e1c131c9bcffbea34c358226263f2765161190387d53a68')

prepare() {
	cd "${pkgname}-${pkgver}"
	autoreconf -i
}

build() {
	cd "${pkgname}-${pkgver}"
	export CFLAGS="${CFLAGS} -Wno-format-security"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
