# Contributor: Franck Barbenoire <contact@franck-barbenoire.fr>

pkgname=syasokoban
pkgver=2.0.1
pkgrel=2
pkgdesc="Still Yet Another Sokoban"
arch=('i686' 'x86_64')
license=('GPL')
url="http://grayskygames.com/sokoban.html"
depends=('sdl')
source=(
   "http://grayskygames.com/sokoban/$pkgname-$pkgver.tar.gz"
   "$pkgname.patch"
)

md5sums=('c8f320e5c43c966eebe184977542e903'
         'c9c45c06287c82097e94d26ec8b3f5e2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p 1 < $srcdir/"$pkgname.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "$srcdir/$pkgname-$pkgver/syasokoban" "$pkgdir/usr/bin/syasokoban"
  install -D -m644 "$srcdir/$pkgname-$pkgver/README.txt" "$pkgdir/usr/share/doc/syasokoban/README.txt"
  mkdir -p "$pkgdir/usr/share/syasokoban"
  cp -R data/* "$pkgdir/usr/share/syasokoban"
}
