# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=autolatex  
pkgver=38.1
pkgrel=1
pkgdesc="Automate generation of large scale LaTeX projects."
url="http://www.arakhne.org/autolatex/"
arch=('any')
license=('GPL')
depends=('glib-perl' 'gtk2-perl' 'python' 'dconf' 'perl-archive-zip' 'perl-locale-gettext' 'perl-config-simple')
backup=("etc/$pkgname/config" )
install=$pkgname.install
source=("http://download.tuxfamily.org/arakhne/pool/universe/a/${pkgname}/${pkgname}_$pkgver-0arakhne0.tar.gz")
md5sums=('67a877e70bfee00dc51a3dea1a52f111')
options=('!emptydirs')

prepare() {
  cd $srcdir/$pkgname-$pkgver/upstream
  bsdtar xvf   $pkgname-$pkgver.tar.gz
  cd $pkgname
  sed -i '14s+^+#+' Makefile.PL
}

build() {
  cd $srcdir/$pkgname-$pkgver/upstream/$pkgname
  perl ./Makefile.PL --disable gtk --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/upstream/$pkgname
  install -d $pkgdir/usr
  perl Makefile.PL --prefix=$pkgdir/usr --disable gtk install
}
