# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=autolatex  
pkgver=35.0
pkgrel=2
pkgdesc="Automate generation of large scale LaTeX projects."
url="http://www.arakhne.org/autolatex/"
arch=('any')
license=('GPL')
depends=('glib-perl' 'gtk2-perl' 'python' 'dconf' 'perl-archive-zip' 'perl-locale-gettext' 'perl-config-simple')
backup=("etc/$pkgname/config" )
install=$pkgname.install
source=(https://codeload.github.com/gallandarakhneorg/autolatex/zip/$pkgname-$pkgver)
sha512sums=('3699bbcfaadf91b4e95ad6be553ba099ca5366712a00f30480ff3fb6b224901baae5bbc0d859b41e80c7f604255e9b4f47bd81f6f5ff9913ce023fc8fbb2c3a0')
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
