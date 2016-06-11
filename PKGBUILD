# Contributor: Patrick Kelly     <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis <aliverius somewhere near tsalikis and a net>
# Contributor: Julian Leyh       <julian@vgai.de>
# Contributor: Rod Kay           <charlie5 on #ada at freenode.net>

pkgname=gtkada
pkgver=2016
pkgrel=1

pkgdesc="GtkAda is a Gtk3 binding for Ada using the OOP and other features of this programming language"
arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/GtkAda/"
license=('GPL')

depends=("gtk3" "gprbuild" "prepare_gnat_util")
makedepends=("gcc-ada")

source=(http://mirrors.cdn.adacore.com/art/5739985fc7a447658e0affae
        patch-shared.gpr.in
        patch-Makefile.in
        patch-aclocal.m4
        patch-gtkglarea.c
        patch-testgtk.gpr)

sha1sums=('024aeb4e6a3d48059b5a80b90d606f760cc05e97'
          '5d165fac792018dceae026083f5c335738879c8d'
          '237efb4ca634752fe21ce299b4261bb1fded2d52'
          '5716bb623634c88e7e04849ca7fc000d76cb4882'
          'cab6c699945ff8b5af0c5de0fd0f088012aba114'
          '1a4069100cca7d2df9de23562f6ef0ede537b57a')



prepare()
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  patch -Np0 -i "$srcdir/patch-shared.gpr.in"
  patch -Np0 -i "$srcdir/patch-Makefile.in"
  patch -Np0 -i "$srcdir/patch-aclocal.m4"
  patch -Np0 -i "$srcdir/patch-gtkglarea.c"
  patch -Np0 -i "$srcdir/patch-testgtk.gpr"
}



build() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  autoconf
  ./configure --prefix=/usr
  DESTDIR=$pkgdir  make -j1  # It doesn't build with -jn where n>1
}



package() 
{
  cd "$srcdir/$pkgname-gpl-$pkgver-src"

  DESTDIR=$pkgdir make -j1 install 
}
