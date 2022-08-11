# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Alex Cartwright (alexc223@googlemail.com)
# Contributor: CRT <crt.011@gmail.com>

pkgname=skipfish
pkgver=2.10b_2kali5
_pkgver=2.10b-2kali5
pkgrel=1
pkgdesc="A fully automated, active web application security reconnaissance tool"
arch=('any')
license=('APACHE')
url='https://gitlab.com/kalilinux/packages/skipfish'
depends=('openssl' 'libidn' 'zlib' 'glibc' 'sh')
source=("https://gitlab.com/kalilinux/packages/skipfish/-/archive/kali/${_pkgver}/skipfish-kali-${_pkgver}.tar.gz"
	"skipfish.patch")

sha256sums=('f497d8bdce5f68c3ac13fb5144359145b777d55cc83262ad6ea8aafa9610a4e7'
            '096e9f7095a499605c8bf29bb9737397e9d5a168ec47888004dc8c2e7ceb0b62')

build() {
	cd "${srcdir}/${pkgname}-kali-${_pkgver}"
	# Patch fixes application run directory system error
	patch -Np0 -i ../skipfish.patch
	patch -Np1 -i debian/patches/Fix-for-openssl-1.1.patch
	make
}	

package() {
	cd "${srcdir}/${pkgname}-kali-${_pkgver}"
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
