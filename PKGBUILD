_cctools_ver=1010.6
_ld64_ver=951.9
_commit=a2724f04cafe3590fbc3d0beacc37293d83a2177
_pkgrev=1

pkgname=cctools
pkgdesc="Apple cctools port for Linux"
pkgver=${_cctools_ver}+g84ce22d
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=("APSL-2.0")
depends=(gcc-libs glibc libdispatch)
makedepends=(clang git)
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
