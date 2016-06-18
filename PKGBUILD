# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Alex Cartwright (alexc223@googlemail.com)
# Contributor: CRT <crt.011@gmail.com>
pkgname=skipfish
pkgver=2.10b
pkgrel=1
pkgdesc="A fully automated, active web application security reconnaissance tool"
arch=('any')
license=('APACHE')
url='http://code.google.com/p/skipfish/'
depends=('openssl' 'libidn' 'zlib' 'glibc' 'sh')
source=("http://skipfish.googlecode.com/files/${pkgname}-${pkgver}.tgz"
	"skipfish.patch")

md5sums=('8edf6092f3d1835cb4a381b7a723db8a'
         '640b24c2989f2316ac5e0926bba3b226')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Patch fixes application run directory system error
	patch -Np0 -i ../skipfish.patch
	make
}	

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/dictionaries"
        cp -rf  dictionaries/* "${pkgdir}/usr/share/${pkgname}/dictionaries/"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/assets" 
	cp -rf  assets/* "${pkgdir}/usr/share/${pkgname}/assets/"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/signatures/"
	cp signatures/* "${pkgdir}/usr/share/${pkgname}/signatures/"
	install -dm755 "${pkgdir}/usr/bin"
	cp -rf  skipfish tools/* "${pkgdir}/usr/bin/"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	cp COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -dm755 "${pkgdir}/usr/share/man/man1/"
        cp doc/skipfish.1 "${pkgdir}/usr/share/man/man1/skipfish.1"
}
