# Maintainer: Philip Abernethy<chais.z3r0 at gmail dot com>
pkgname=arprec
pkgver=2.2.18
pkgrel=1
pkgdesc="An arbitrary precision math library for C++ and Fortran-90."
url="http://crd.lbl.gov/~dhbailey/mpdist/"
arch=('x86_64' 'i686')
license=('custom:BSD-LBNL')
changelog="${pkgname}.changelog"

source=("http://crd.lbl.gov/~dhbailey/mpdist/${pkgname}-${pkgver}.tar.gz"
        "http://crd.lbl.gov/~dhbailey/mpdist/BSD-LBNL-License.doc"
        "${pkgname}.patch")
sha512sums=('372eb0a0c3aceac0d222679058f47c4d1037b5a51524b752b87f1b61c1b25101c34d4e56d9da45b4075ea7040dd59a597e0add4f34be902955dcf209423a6579'
            '5db2d242c249ccd6ed4e7fc59a6ebba7c83274b1cf330d0d12e97da32ea0da9b9b0b0c1f51c58f809658ea92f7afbf5d3a1c75d899f94ec38a0d91926608cf85'
            '8c90b3a7fa21c5a6c9782af81eb4f8d3100ba3c951bffa4422be39deec2a4b044d166e0d768ee0bad8daaf4eee40c0107d818a8cacad61b55d63de8ed3244f74')

# Uncomment for big packages
#PKGEXT=".pkg.tar"

build() {
	patch -p 1 < "${source[2]}"
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr && make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "${srcdir}/"${pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	install -m644 "${srcdir}"/BSD-LBNL-License.doc "${pkgdir}"/usr/share/licenses/${pkgname}/
}
