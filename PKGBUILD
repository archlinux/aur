# Contributor: Franck Barbenoire <contact@franck-barbenoire.fr>

pkgname=syasokoban
pkgver=2.0.2
pkgrel=1
pkgdesc="Still Yet Another Sokoban"
arch=('i686' 'x86_64')
license=('GPL')
url="http://grayskygames.com/sokoban.html"
depends=('sdl')
source=(
   "https://github.com/davidjoffe/sokoban/archive/refs/tags/v${pkgver}.tar.gz"
   "$pkgname.patch"
)
sha256sums=('c9c1a1ad4e12e5376b2a4dfbaf12f1c1f4e1d51fac2954f6a8da7467181a7851'
            '6b4203362664b6060a0e9dd9edda01faff72f61f7b6ad55a5a336670cc2ba5d7')

prepare() {
  cd "$srcdir/sokoban-$pkgver"
  patch -p 1 < $srcdir/"$pkgname.patch"
}

build() {
  cd "$srcdir/sokoban-$pkgver"
  make
}

package() {
  cd "$srcdir/sokoban-$pkgver"
  install -D -m755 "$srcdir/sokoban-$pkgver/syasokoban" "$pkgdir/usr/bin/syasokoban"
  install -D -m644 "$srcdir/sokoban-$pkgver/README.md" "$pkgdir/usr/share/doc/syasokoban/README.md"
  mkdir -p "$pkgdir/usr/share/syasokoban"
  cp -R data/* "$pkgdir/usr/share/syasokoban"
}