# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ibm-tpm2-tss-git
pkgver=v1.6.0.r0.gc4e131e
pkgrel=1
pkgdesc='International Business Machines Trusted Platform Module 2.0 Software Stack'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmtpm20tss/'
license=('BSD')
depends=('efivar' 'openssl')
provides=('ibm-tpm2-tss')
conflicts=('ibm-tpm2-tss')
source=('git+https://git.code.sf.net/p/ibmtpm20tss/tss')
sha256sums=('SKIP')

pkgver() {
	cd tss
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd tss
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd tss
	make DESTDIR="$pkgdir/" install
}
