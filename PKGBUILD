# Maintainer: Philip Abernethy<chais.z3r0 at gmail dot com>
pkgname=arprec
pkgver=2.2.19
pkgrel=1
pkgdesc="An arbitrary precision math library for C++ and Fortran-90."
url="http://crd.lbl.gov/~dhbailey/mpdist/"
arch=('x86_64' 'i686')
license=('custom:LBNL-BSD')
makedepends=('catdoc')
changelog="${pkgname}.changelog"

source=("http://crd.lbl.gov/~dhbailey/mpdist/${pkgname}-${pkgver}.tar.gz"
        "http://crd.lbl.gov/~dhbailey/mpdist/LBNL-BSD-License.doc")
sha512sums=('97cf090398aa169e31711077efd26dc6da1f62291ab37b241b133634838bdd44743f85b86b861a3be18d2696ae9132afb6cd1871502bedb9cc17dfb63fde2632'
            '5db2d242c249ccd6ed4e7fc59a6ebba7c83274b1cf330d0d12e97da32ea0da9b9b0b0c1f51c58f809658ea92f7afbf5d3a1c75d899f94ec38a0d91926608cf85')

# Uncomment for big packages
#PKGEXT=".pkg.tar"

build() {
	cd ${pkgname}
	./configure --prefix=/usr && make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "${srcdir}/"${pkgname}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	catdoc "${srcdir}"/LBNL-BSD-License.doc > "${pkgdir}"/usr/share/licenses/${pkgname}/LBNL-BSD-License.txt
}
