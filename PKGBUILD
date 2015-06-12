# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=arprec
pkgver=2.2.17
pkgrel=1
pkgdesc="An arbitrary precision math library for C++ and Fortran-90."
url="http://crd.lbl.gov/~dhbailey/mpdist/"
arch=('x86_64' 'i686')
license=('custom:BSD-LBNL')
changelog="${pkgname}.changelog"

source=("http://crd.lbl.gov/~dhbailey/mpdist/${pkgname}-${pkgver}.tar.gz"
        "http://crd.lbl.gov/~dhbailey/mpdist/BSD-LBNL-License.doc")
sha512sums=('d10f7d3e3d61274a36d253d2b50004bbf15447be3ffbd37bb0334ba62bd624e27fb9e26364fa1b89c1d4dfbb4136ab93d865f990ce123ecf94d9614e3ac567d1'
            '5db2d242c249ccd6ed4e7fc59a6ebba7c83274b1cf330d0d12e97da32ea0da9b9b0b0c1f51c58f809658ea92f7afbf5d3a1c75d899f94ec38a0d91926608cf85')

# Uncomment for big packages
#PKGEXT=".pkg.tar"

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr && make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "${srcdir}/"${pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	install -m644 "${srcdir}"/BSD-LBNL-License.doc "${pkgdir}"/usr/share/licenses/${pkgname}/
}
