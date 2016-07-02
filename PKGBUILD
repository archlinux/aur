# Contributor: Sietse van der Molen
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gprbuild
pkgver=2016
pkgrel=1

depends=('gcc-ada' 'xmlada')

pkgdesc="Software tool designed to help automate the construction of multi-language systems"

arch=('any')
license=('GPL')
url="http://www.adacore.com/gnatpro/toolsuite/gprbuild/"

source=("http://mirrors.cdn.adacore.com/art/57399662c7a447658e0affa8"
        "Makefile.archy")

sha1sums=('c85b877596dbc53bfc39ec5b23f674e8463677ce'
          '222357dc7f46b9ab6a8c2df098632c67b4505743')



prepare()
{
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

  cp $srcdir/Makefile.archy ${WRKSRC}

  cd $pkgname-gpl-$pkgver-src
  mkdir -p obj
}



build() 
{
  cd $pkgname-gpl-$pkgver-src

  ./configure --prefix="/usr"
  PREFIX=/usr  make -j13 -f Makefile.archy all
}



package() 
{
  cd $pkgname-gpl-$pkgver-src

  DESTDIR=$pkgdir  PREFIX=/usr  make  -f Makefile.archy  prefix="$pkgdir/usr"  install
}
