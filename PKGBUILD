# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wp2latex  
pkgver=3.111
pkgrel=1
pkgdesc="Converts WordPerfect document formats to LaTeX"
url="http://www.penguin.cz/~fojtik/wp2latex/wp2latex.htm"
arch=('i686' 'x86_64')
license=('GPL')
source=("http://www.penguin.cz/~fojtik/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('3163643c951912137938a91da5594b87f2e0e887d29b7bc9d977bd66eb676ebf')
depends=('libjpeg' 'gcc-libs' 'libpng')
options=('!strip')

build() {
  cd $pkgname-$pkgver
  CPPFLAGS+="-fpermissive -std=c++11" ./configure --prefix=/usr
  make x2latex
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "${srcdir}"/$pkgname-$pkgver/bin/linux/$pkgname \
    $pkgdir/usr/bin/$pkgname 
  install -Dm644 "$srcdir"/$pkgname-$pkgver/doc/$pkgname.man \
    "$pkgdir"/usr/share/man/man1/$pkgname.1 
  install -d "$pkgdir"/usr/share/$pkgname/doc
  cp -R "$srcdir"/$pkgname-$pkgver/doc/program.man/* \
    "$pkgdir"/usr/share/$pkgname/doc
  install -d "$pkgdir"/usr/share/texmf/tex/latex/$pkgname
  cp "$srcdir"/$pkgname-$pkgver/styles.tex/* \
    "$pkgdir"/usr/share/texmf/tex/latex/$pkgname
}
