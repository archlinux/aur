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
        "Makefile.archy"
        "patch-configure.in")

sha1sums=('c85b877596dbc53bfc39ec5b23f674e8463677ce'
          '222357dc7f46b9ab6a8c2df098632c67b4505743'
          '30c6996c6e0676d357835945d53d89e8fb9176ea')



prepare()
{
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

  cp $srcdir/Makefile.archy ${WRKSRC}

  cd $pkgname-gpl-$pkgver-src
#  patch -p0 -i ../patch-gnat_targparm
  patch -p0 -i ../patch-configure.in

  mkdir -p obj
}



build() 
{
  cd $pkgname-gpl-$pkgver-src

  autoconf
  ./configure --prefix="/usr"
  PREFIX=/usr  make -j13 -f Makefile.archy all
}



package() 
{
  cd $pkgname-gpl-$pkgver-src

  DESTDIR=$pkgdir  PREFIX=/usr  make  -f Makefile.archy  prefix="$pkgdir/usr"  install
}
