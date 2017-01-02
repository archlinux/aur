_cctools_ver=877.8
_ld64_ver=253.9
_pkgrev=1

pkgname=cctools
pkgdesc="Apple cctools port for Linux"
pkgver=${_cctools_ver}
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=("APSL")
depends=(llvm)
makedepends=(gcc-objc)
provides=(x86_64-apple-darwin-binutils)
conflicts=(x86_64-apple-darwin-binutils)
source=("https://github.com/tpoechtrager/cctools-port/archive/cctools-${_cctools_ver}-ld64-${_ld64_ver}-${_pkgrev}.tar.gz")
md5sums=('ea1e7a9277512fc548e161e7b33e3a66')

build() {
	cd cctools-port-cctools-${_cctools_ver}-ld64-${_ld64_ver}-${_pkgrev}/cctools
	./autogen.sh
	./configure \
		--prefix=/usr \
		--target=x86_64-apple-darwin \
		--with-llvm-config=/usr/bin/llvm-config
	make
}

package() {
	cd cctools-port-cctools-${_cctools_ver}-ld64-${_ld64_ver}-${_pkgrev}/cctools
	make DESTDIR="$pkgdir" install
}
