# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-evm-utils-git
pkgver=1.5.r32.g420932e
pkgrel=1
pkgdesc='Produce and verify digital signatures which are used by Linux kernel integrity subsystem'
arch=('x86_64')
url='https://github.com/mimizohar/ima-evm-utils'
license=('GPL')
depends=('docbook-xml' 'ibm-tpm2-tss' 'openssl' 'tpm2-tss')
makedepends=('asciidoc')
provides=('ima-evm-utils')
conflicts=('ima-evm-utils')
source=('git+https://github.com/mimizohar/ima-evm-utils.git')
sha256sums=('SKIP')

pkgver() {
	cd ima-evm-utils
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
