# Maintainer: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se3

pkgname=mingw-w64-lua
pkgver=5.2.3
pkgrel=2
pkgdesc="A powerful light-weight programming language designed for extending applications. (mingw-w64)" 
arch=('any')
url="http://www.lua.org/" 
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
license=('MIT')
source=($url/ftp/lua-$pkgver.tar.gz)
options=(!strip !buildflags staticlibs)
md5sums=('dc7f94ec6ff15c985d2d6ad0f1b35654')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() { 
  unset LDFLAGS
  cd $srcdir/lua-$pkgver
  for _arch in ${_architectures}; do
    make -j1 CC=${_arch}-gcc \
      AR="${_arch}-ar rcu" \
      RANLIB="${_arch}-ranlib" \
      STRIP="${_arch}-strip" \
      CC="${_arch}-gcc" \
      INSTALL_TOP="${pkgdir}/usr/${_arch}" \
      TO_BIN="lua.exe luac.exe lua52.dll" \
      mingw install
    make clean
  done
}
