# Maintainer: Benjamin Bukowski <benjamin.bukowski@gmail.com>

pkgname=lib32-libfbclient
pkgver=2.5.6.27020
pkgrel=1
pkgdesc="Client library for Firebird. (32-Bit)"
arch=('x86_64')
url="http://www.firebirdsql.org/"
license=('custom:IPL' 'custom:IDPL')
depends=('lib32-glibc>=2.7' 'lib32-gcc-libs' 'lib32-icu>=50.1' 'lib32-ncurses')
makedepends=('gcc-multilib')
options=('!makeflags' '!libtool')

source=("http://downloads.sourceforge.net/firebird/Firebird-$pkgver-0.tar.bz2")
md5sums=('5514798d5dca8c3525525c61cf35283e')

build() {
  cd $srcdir/Firebird-$pkgver-0

	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh --prefix=/usr --with-system-icu --without-fbudf \
    --without-fbsbin --without-fbconf --without-fbdoc --without-fbsample \
    --without-fbsample-db --without-fbintl --without-fbmisc --without-fbhelp \
    --without-fbsecure-db --with-fbmsg=/usr/share/firebird --without-fblog \
    --without-fbglock --without-fbplugins

	make CXXFLAGS='-std=gnu++98 -flifetime-dse=1'
}

package() {
  cd $srcdir/Firebird-$pkgver-0/gen

  mkdir -p $pkgdir/usr/
  cp -R firebird/lib $pkgdir/usr/lib32
  rm -f $pkgdir/usr/lib32/libedit.a
}

