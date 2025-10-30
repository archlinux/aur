# Maintainer: lekker <bradyhickey at outlookdot com>
# Contributor: Michal Wojdyla
# Contributor: Schala

_cctools_ver=1030.6.3
_ld64_ver=956.6
_commit=e5dfc5633cb9060a94d16b8d78a01eb0b3620021
_pkgrev=1
pkgname=cctools
pkgdesc="Apple's cross-compiling toolchain ported to Linux"
pkgver=${_cctools_ver}+g${_commit:0:7}
pkgrel=1
arch=(x86_64 i686)
url="https://github.com/tpoechtrager/cctools-port"
license=("APSL-2.0")
depends=(gcc-libs glibc libdispatch util-linux-libs)
makedepends=(clang git llvm)
optdepends=(
  'xar: for bitcode bundle support'
  'tapi-git: for SDKs with .tdb stubs'
)


provides=($CARCH-apple-darwin-binutils)
conflicts=($CARCH-apple-darwin-binutils)
source=("git+https://github.com/tpoechtrager/cctools-port.git#commit=${_commit}")
md5sums=('SKIP')

build() {
  cd cctools-port/cctools
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --target=$CARCH-apple-darwin \
    --with-llvm-config=/usr/bin/llvm-config \
    --libexecdir=/usr/lib
  make
}

package() {
  cd cctools-port/cctools
  make DESTDIR="$pkgdir" install   
}
