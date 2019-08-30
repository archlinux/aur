pkgname=intercal
pkgver=0.31
pkgrel=1
pkgdesc="INTERCAL compiler"
arch=('i686' 'x86_64')
url="http://catb.org/esr/intercal/"
license=('GPL2')
options=('staticlibs')
depends=('gcc')  # INTERCAL is special.
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d69b69b52f25fbe3ec67a485420831bd844ea4c33144552db2363ca913ef9bb36d2271967d5b2d65153292d42090696a3917039813e7d5823f3f64f43397e28f')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i -e 's/0.30/0.31/' configure.ac
  autoreconf -fi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
