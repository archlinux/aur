# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=lordsawar
pkgver=0.3.1
pkgrel=2
pkgdesc="Turn-based strategy game for controling of as many cities as possible"
arch=('x86_64')
url="http://www.nongnu.org/lordsawar/"
license=("GPL")
depends=('libxslt' 'gtkmm3' 'libarchive' 'gstreamer0.10-mm')
makedepends=('intltool')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"
        'gcc7_errors.patch')
sha256sums=('9bc75c4c14953e9d70bd4c130a1b8803aac681b97c7616c657241c1e4fe864ab'
            '11b46cbb7ac127998e1a44fef828263c178b895e96420aefdd65fbbff5414928')

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
