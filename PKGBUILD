# Maintainer: nandub <dev+arch@nandub.info>

pkgname=adns-ipv6
_pkgname=adns
pkgver=1.4
pkgrel=1
pkgdesc="adns is an asyncronous replacement resolver library with ipv6 support"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~ian/adns/"
license=('GPL')
depends=('glibc')
conflicts=('adns')
source=(http://www.chiark.greenend.org.uk/~ian/$_pkgname/ftp/$_pkgname-$pkgver.tar.gz
	http://people.debian.org/~lucab/deb/adns/adns-ipv6.patch)
md5sums=('88bc7bbf3f62a8d4fb186b8f72ead853'
         '848281f907996d3ccfbabd5036ac51a5')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 < $srcdir/adns-ipv6.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  mkdir -p $pkgdir/usr/{lib,include,bin}
  make prefix=$pkgdir/usr install
}
