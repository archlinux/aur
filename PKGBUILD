# Maintainer: Benjamin Bukowski <benjamin.bukowski@gmail.com>

pkgname=lib32-libfbclient
_pkgver=2.5.4.26856
_buildver=0
pkgver=${_pkgver}_${_buildver}
pkgrel=1
pkgdesc="Client library for Firebird. (32-Bit)"
arch=('x86_64')
url="http://www.firebirdsql.org/"
license=('IPL' 'IDPL')
depends=('lib32-glibc>=2.7' 'lib32-gcc-libs' 'lib32-icu>=50.1' 'lib32-ncurses')
makedepends=('gcc-multilib')
options=('!makeflags' '!libtool')
source=(http://downloads.sourceforge.net/firebird/Firebird-$_pkgver-$_buildver.tar.bz2)
md5sums=('7a17ec9889424b98baa29e001a054434')

build() {
  cd $srcdir/Firebird-$_pkgver-$_buildver

	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --with-system-icu --without-fbudf \
    --without-fbsbin --without-fbconf --without-fbdoc --without-fbsample \
    --without-fbsample-db --without-fbintl --without-fbmisc --without-fbhelp \
    --without-fbsecure-db --with-fbmsg=/usr/share/firebird --without-fblog \
    --without-fbglock --without-fbplugins

  make
}

package() {
  cd $srcdir/Firebird-$_pkgver-$_buildver

  mkdir -p $pkgdir/usr/
  cp -R gen/firebird/lib $pkgdir/usr/lib32
  rm -f $pkgdir/usr/lib32/libedit.a
}

