# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=guile1.8-gui
_pkgname=guile-gui
pkgver=0.3
pkgrel=4
pkgdesc="Guile Scheme code that aims to implement a graphical user interface"
arch=('i686' 'x86_64')
url="http://www.ossau.uklinux.net/guile/"
license=('LGPL')
depends=('guile1.8')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$_pkgname-$pkgver.tar.gz
        guile1.8.patch)
sha256sums=('6fddfd6774e8c05feecfb5bc373107bddf81999d23bdf0d25830661ef8b477f4'
            '966ad4b3b7718ecebb5ba56c15ec7db8ccbe350813d21cfa72e302d84f052311')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  patch -Np1 -i $srcdir/guile1.8.patch
  
  # aclocal -I macros
  # libtoolize --automake --copy
  autoconf
  # automake --copy --add-missing --gnu

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  make DESTDIR="$pkgdir/" install
  ln -s /usr/bin/guile-gui $pkgdir/usr/bin/guile-gui1.8
} 
