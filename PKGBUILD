# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>

pkgname=llvm-mingw-w64-toolchain-msvcrt-bin
pkgver=20241001
pkgrel=1
pkgdesc="LLVM/Clang/LLD based mingw-w64 toolchain (MSVCRT) targeting i686, x86-64, armv7, and aarch64"
_crt=msvcrt
arch=('x86_64')
url="https://github.com/mstorsjo/llvm-mingw"
license=('custom')
depends=()
provides=('llvm-mingw-w64-toolchain' 'mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
source=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-${CARCH}.tar.xz")
if [ "$CARCH" = "aarch64" ]; then
  sha256sums=('0000000000000000000000000000000000000000000000000000000000000000') # No aarch64 build for MSVCRT target.
else
  sha256sums=('de0458fcf30d4683344ef1e7666c67c6f0204b5c018de0253ff2a124ea3803b7')
fi

options=(!strip)

package() {
	mkdir -p ${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt
	cp -dpr --no-preserve=ownership ./llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-${CARCH}/* "${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt"
}
