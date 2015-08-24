# Maintainer: Alister.Hood <gmail>
# Contributor: Gergely Tamas <dice@mfa.kfki.hu>
pkgname=gopchop
pkgver=1.1.8
pkgrel=3
pkgdesc="Cut and merge MPEG2-PS files at GOP boundaries without reencoding."
url="http://outflux.net/unix/software/GOPchop/"
arch=('i686' 'x86_64')
license="GPL"
depends=('libmpeg2' 'libxml2' 'gtk2')
makedepends=('pkgconfig')
source=(https://downloads.sourceforge.net/project/gopchop/GOPchop%20-%20Development/1.1.8/$pkgname-$pkgver.tar.gz
        http://ftp.de.debian.org/debian/pool/main/g/gopchop/gopchop_1.1.8-5.debian.tar.gz)
md5sums=('614bd1d34960b2dc420acde423f246e1' 'b602e55c38cfbe182d0619f8932a7f13')

build() {
  cd $srcdir/$pkgname-$pkgver

  msg "Applying patches" 
  for i in $srcdir/debian/patches/*.patch; do patch -p1<$i; done
  sed -i 's|.png||g' $pkgname.desktop
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
