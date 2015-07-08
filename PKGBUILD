# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

pkgname=libaacplus
pkgver=2.0.2
pkgrel=8
pkgdesc="3GPP AAC+ High Efficiency Advanced Audio Codec v2 (HE-AAC+) Encoder Shared Library"
arch=('i686' 'x86_64')
url="http://tipok.org.ua/node/17"
license=('LGPL' '3GPP')
options=(!makeflags !libtool)
conflicts=('aacplusenc')
provides=('aacplusenc')
optdepends=('fftw')
depends=('glibc')
makedepends=('unzip')
source=(http://tipok.org.ua/downloads/media/aac+/libaacplus/$pkgname-$pkgver.tar.gz)
md5sums=('3fc15d5aa91d0e8b8f94acb6555103da')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  for i in $(find . -name 'Makefile.am');do sed 's|INCLUDES|AM_CPPFLAGS|g' -i $i; done
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr --enable-static=off
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


        


# vim:set ts=2 sw=2 et:
