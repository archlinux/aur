# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=lordsawar
pkgver=0.3.1
pkgrel=2
pkgdesc="Turn-based strategy game for controling of as many cities as possible"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lordsawar/"
license=("GPL")
depends=('libxslt' 'gtkmm3' 'libarchive' 'gstreamer0.10-mm')
makedepends=('intltool')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"
        'gcc7_errors.patch')
md5sums=('d7fd7bdfa417e545fdbe772175ddcddd'
         'bdc38caebdd75b5d991b52a687fab5db')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir/gcc7_errors.patch"
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr 
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
