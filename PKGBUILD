# Contributor: Patrick Kelly     <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis <aliverius somewhere near tsalikis and a net>
# Contributor: Julian Leyh       <julian@vgai.de>
# Contributor: Rod Kay           <charlie5 on #ada at freenode.net>

pkgname=gtkada
pkgver=2015
pkgrel=1

pkgdesc="GtkAda is a Gtk3 binding for Ada using the OOP and other features of this programming language"
arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/GtkAda/"
license=('GPL')

depends=("gtk3" "gprbuild")
makedepends=("gcc-ada")

source=(http://mirrors.cdn.adacore.com/art/db00d9243e8d34c0da0a583c22903272f2d28135
        patch-Makefile.in
        patch-projects-Makefile.in)

md5sums=('c152b45c9f768aef92cf325bfb2ca138'
         '88657345aace9e2020f74854daa64ef2'
         '7143323e2c631df019fafc109b432703')



prepare()
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  patch -Np0 -i "$srcdir/patch-Makefile.in"
  patch -Np0 -i "$srcdir/patch-projects-Makefile.in"
}



build() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  ./configure --prefix=/usr --with-GL=no
  DESTDIR=$pkgdir   make -j1  # It doesn't build with -jn where n>1
}



package() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  DESTDIR=$pkgdir make -j1 install 
}
