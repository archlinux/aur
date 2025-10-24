# Maintainer: kazzakali <bradyhickey at outlookdot com>
# Contributor: Michal Wojdyla
# Contributor: Schala

_cctools_ver=1024.3
_ld64_ver=955.13
_commit=eea1c9ee2a3a386d96898b39feaa62a58a33f82a
_pkgrev=1
pkgname=cctools
pkgdesc="Apple's cross-compiling toolchain ported to Linux"
pkgver=${_cctools_ver}+g${_commit:0:7}
pkgrel=2
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
