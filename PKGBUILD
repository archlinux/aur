# Contributor: Franck Barbenoire <contact@franck-barbenoire.fr>

pkgname=syasokoban
pkgver=2.0.1
pkgrel=1
pkgdesc="Still Yet Another Sokoban"
arch=('i686' 'x86_64')
license=('GPL')
url="http://grayskygames.com/sokoban.html"
depends=('sdl')
source=(
   "http://grayskygames.com/sokoban/$pkgname-$pkgver.tar.gz"
   "$pkgname.patch"
)

md5sums=(
    '3735ea7f164587165d4d03805a87b1a5'
    'ae55b562a3b3b0a87bf139d58d1897ea'
)

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
