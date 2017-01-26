_cctools_ver=886
_ld64_ver=264.3.102
_commit=84ce22dbb22a26ce7f392e9de0ee39c2efe6fd68
_pkgrev=1

pkgname=cctools
pkgdesc="Apple cctools port for Linux"
pkgver=${_cctools_ver}+g84ce22d
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=("APSL")
depends=(llvm)
makedepends=(gcc-objc git)
provides=(x86_64-apple-darwin-binutils)
conflicts=(x86_64-apple-darwin-binutils)
source=("git+https://github.com/tpoechtrager/cctools-port.git#commit=${_commit}")
md5sums=('SKIP')

build() {
	#cd cctools-port-cctools-${_cctools_ver}-ld64-${_ld64_ver}-${_pkgrev}/cctools
	cd cctools-port/cctools
	./autogen.sh
	./configure \
		--prefix=/usr \
		--target=x86_64-apple-darwin \
		--with-llvm-config=/usr/bin/llvm-config \
		--libexecdir=/usr/lib
	make
}

package() {
	#cd cctools-port-cctools-${_cctools_ver}-ld64-${_ld64_ver}-${_pkgrev}/cctools
	cd cctools-port/cctools
	make DESTDIR="$pkgdir" install
}
