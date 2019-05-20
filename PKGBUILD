# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Alex Cartwright (alexc223@googlemail.com)
# Contributor: CRT <crt.011@gmail.com>
pkgname=skipfish
pkgver=2.10b
pkgrel=2
pkgdesc="A fully automated, active web application security reconnaissance tool"
arch=('any')
license=('APACHE')
url='http://code.google.com/p/skipfish/'
depends=('openssl' 'libidn' 'zlib' 'glibc' 'sh')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/skipfish/${pkgname}-${pkgver}.tgz"
	"skipfish.patch")

sha256sums=('1a4fbc9d013f1f9b970946ea7228d943266127b7f4100c994ad26c82c5352a9e'
            '096e9f7095a499605c8bf29bb9737397e9d5a168ec47888004dc8c2e7ceb0b62')
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
