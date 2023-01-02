# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Bastian Germann <bastian.germann[at]gmx[dot]de>
# Contributor: hcartiaux
# Contributor: Chris Mann <cshclm[at]gmail[dot]com>

pkgname=unrar-free
pkgver=0.1.2
pkgrel=2
epoch=1
pkgdesc="Free utility to extract files from RAR archives."
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/bgermann/unrar-free"
license=('GPL')
depends=('libarchive')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dbd559cd608c34d646615c383ee21a4c6dea84b669db43427717d8b46c4eac45')

prepare() {
	cd "${pkgname}-${pkgver}"
	autoreconf -i
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure CFLAGS='-Wno-format-security' --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
