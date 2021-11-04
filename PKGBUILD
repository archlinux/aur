# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-evm-utils-git
pkgver=v1.3.2.r0.g00a0e66
pkgrel=1
pkgdesc='Produce and verify digital signatures which are used by Linux kernel integrity subsystem'
arch=('x86_64')
url='https://sourceforge.net/p/linux-ima/ima-evm-utils/ci/master/tree/'
license=('GPL')
depends=('docbook-xml' 'ibm-tpm2-tss' 'openssl' 'tpm2-tss')
provides=('ima-evm-utils')
conflicts=('ima-evm-utils')
source=("git+https://git.code.sf.net/p/linux-ima/ima-evm-utils")
sha256sums=('SKIP')

pkgver() {
	cd ima-evm-utils
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ima-evm-utils
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd ima-evm-utils
	make -k check
}

package() {
	cd ima-evm-utils
	make DESTDIR="$pkgdir/" install
}
