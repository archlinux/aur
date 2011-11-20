# Based on the official webalizer PKGBUILD Maintained by: Travis Willard <travisw@wmpub.ca>
# Webalizer Xtended PKGBUILD maintanier: Jeff Anderson <jefferya@programmerq.net>

pkgname=webalizer-xtended
pkgver=2.01
pkgrel=2
pkgdesc="A web statistics generator patched to report 404 errors as well."
url="http://www.patrickfrei.ch/webalizer/"
license="GPL"
arch=('i686' 'x86_64')
depends=('gd' 'geoip')
makedepends=()
replaces=(webalizer)
conflicts=(webalizer)
source=(ftp://ftp.mrunix.net/pub/webalizer/old/webalizer-$pkgver-10-src.tgz \
	http://www.patrickfrei.ch/webalizer/rb24/webalizer-$pkgver-10-RB24-patch.tar.gz)
md5sums=('9217595005aec46a505e1fb349052a8e'
         'd73c08c94f1e4bbbfa0be9e3c1de089c')

build() {
  cd $startdir/src/webalizer-$pkgver-10
  patch -p1 < $startdir/src/webalizer-$pkgver-10-RB24-patch
  ./configure --prefix=/usr --enable-geoip
  make || return 1

  # Set up our directory structure
  install -d -m755 $startdir/pkg/usr/bin $startdir/pkg/usr/share/man/man1 \
                   $startdir/pkg/etc

  make prefix=$startdir/pkg/usr datarootdir=$startdir/pkg/usr/share \
       ETCDIR=$startdir/pkg/etc install

  cd $startdir/pkg/usr/bin
  rm -fr webazolver
  ln -s webalizer webazolver
}

