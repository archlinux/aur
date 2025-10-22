_cctools_ver=1024.3
_ld64_ver=955.13
_commit=eea1c9ee2a3a386d96898b39feaa62a58a33f82a
_pkgrev=1

pkgname=cctools
pkgdesc="Apple cctools port for Linux"
pkgver=${_cctools_ver}+g${_commit:0:7}
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=("APSL-2.0")
depends=(gcc-libs glibc libdispatch)
makedepends=(clang git llvm)
optdepends=(
  'apple-libtapi: for SDKs with .tdb stubs'
  'xar: for bitcode bundle support'
)
provides=(x86_64-apple-darwin-binutils)
conflicts=(x86_64-apple-darwin-binutils)
source=("git+https://github.com/tpoechtrager/cctools-port.git#commit=${_commit}")
md5sums=('SKIP')

build() {
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
  cd cctools-port/cctools
  make DESTDIR="$pkgdir" install
}
