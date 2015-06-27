# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=autolatex  
pkgver=35.1
pkgrel=1
pkgdesc="Automate generation of large scale LaTeX projects."
url="http://www.arakhne.org/autolatex/"
arch=('any')
license=('GPL')
depends=('glib-perl' 'gtk2-perl' 'python' 'dconf' 'perl-archive-zip' 'perl-locale-gettext' 'perl-config-simple')
backup=("etc/$pkgname/config" )
install=$pkgname.install
source=(https://codeload.github.com/gallandarakhneorg/autolatex/zip/$pkgname-$pkgver)
sha512sums=('21c250fb1209fc463c0b8e55195e644ff25b32cf19ebf74d3f5454cc24e96b4ba2dca8b9240a40c1a65fe335c28435bfe095d6f982ddd5c712a7c8bc29c6d029')
options=('!emptydirs')

prepare() {
  cd $srcdir/$pkgname-$pkgname-$pkgver
  sed -i '14s+^+#+' Makefile.PL
}

build() {
  cd $srcdir/$pkgname-$pkgname-$pkgver
  perl ./Makefile.PL --disable gtk --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgname-$pkgver
  install -d $pkgdir/usr
  perl Makefile.PL --prefix=$pkgdir/usr --disable gtk install
}
