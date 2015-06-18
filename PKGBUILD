# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
pkgname=tcpxtract
pkgver=1.0.1
pkgrel=5
pkgdesc="A tool for extracting files from network traffic"
url="http://tcpxtract.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libpcap')
options=('!emptydirs')
changelog=Changelog
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download"
	'01_fixmanpage.patch'
	'02-fix_png_header_bytes.patch'
	'conf_default_path.patch'
	'fix-excessive-sync.patch'
	'tcpxtract-fix-segfault.patch')
sha256sums=('613aa6be39772b236d89c5ef377c27b10ac44d1c34731105599283862dfc05be'
            'efaba466fb36eef76e1c5071a83b82056d1604322a5a1edbe0824828ea0298e2'
            'dd36070732e433665543ef86a13e68823d3c661d3eea7db0785fcab055295944'
            '3591411f1fba7caeb16f05f3e67fc716e1e8b525b118680ab103b1722cea50cf'
            'a50480e35d3fa9daffecd3681d161822c7926b652ed09fd7a62d7b909fffced7'
            '8f5627378a29f5a111227a39ad5001a81195b11e74ec375924ce6c7ab96e1819')

prepare() {
	cd ${pkgname}-${pkgver}
	# apply patches
	for file in ../*.patch
	do
		patch -i ${file}
	done
}

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}

