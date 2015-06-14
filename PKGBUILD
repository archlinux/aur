# Contributor: Robert Emil Berge <robert@rebi.no>
# Maintainer: AppleBloom <rat.o.drat@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=imgseek
pkgver=0.8.6
pkgrel=9
pkgdesc="a photo collection manager and viewer with content-based search and many other features"
url="http://www.imgseek.net"
depends=('pyqt3' 'imagemagick' 'python-imaging')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://downloads.sourceforge.net/sourceforge/imgseek/imgSeek-$pkgver.tar.bz2" 
        "python27.patch" 
        "make_it_work.patch")
md5sums=('4b311475b51be649deb45afd6a12eaa2'
         '18757ccbd513081228e993d6221060c1'
         'efab62e2f1b21196060e07293fe2dc1c')

_dir="imgSeek-$pkgver"

prepare() {
  cd "$_dir"
  patch -p1 -i ../make_it_work.patch
  patch -p1 -i ../python27.patch
}

build() {
  cd "$_dir"
  python2 setup.py build
}

package() {
  cd "$_dir"
  python2 setup.py install --prefix="$pkgdir"/usr
  cd "$pkgdir"/usr/lib/python2.7/site-packages/imgSeekLib
  ln -s ImageDB.py ImgDB.py
}
