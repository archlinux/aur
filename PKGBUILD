# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=dwdiff
pkgver=2.1.4
pkgrel=5
pkgdesc="A front-end for the diff program that operates at the word level instead of the line level"
arch=('x86_64')
url="https://os.ghalkes.nl/dwdiff.html"
depends=('diffutils' 'icu')
license=('GPL')
source=("https://os.ghalkes.nl/dist/$pkgname-$pkgver.tar.bz2"
        icu68.patch)
sha256sums=('df16fec44dcb467d65a4246a43628f93741996c1773e930b90c6dde22dd58e0a'
            'b4248cedec5eec8ff280244e41c3450d302a47e50ec126b4dfdd91d7131dd941')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  #patch -Np0 -i ../icu68.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --without-dwfilter
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir"/usr install
}
