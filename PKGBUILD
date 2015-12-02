# Contributor: Sietse van der Molen
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gprbuild
pkgver=2015
pkgrel=1

depends=('gcc-ada' 'xmlada')

pkgdesc="Software tool designed to help automate the construction of multi-language systems"

arch=('any')
license=('GPL')
url="http://www.adacore.com/gnatpro/toolsuite/gprbuild/"

source=("http://mirrors.cdn.adacore.com/art/564b3e2ec8e196b040fbd13a"
        "patch-gnat_targparm")

sha256sums=('5d5bbc8c57075250c264e2f15d9949383450ac696eb8a90803c2a36b55ecd0e2'
            'd5da23b8457c2746e2a23adcfea053d070a08b84e87a2bf076a29245e75abdc5')



prepare()
{
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

  cd $pkgname-gpl-$pkgver-src
  patch -p0 -i ../patch-gnat_targparm
}



build() 
{
  cd $pkgname-gpl-$pkgver-src

  ./configure --prefix="/usr"
  PREFIX=/usr  make all
}



package() 
{
  cd $pkgname-gpl-$pkgver-src

  DESTDIR=$pkgdir  PREFIX=/usr  make  prefix="$pkgdir/usr" install
}
