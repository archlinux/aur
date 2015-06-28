#Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
#Contributor: Dwight Schauer <dschauer@gmail.com>
#Contributor: GdelaRey <arch at delarey dot org>
#Maintainer: aksr <aksr at t-com dot me>
_pkgname=THE
pkgname=hessling-editor-das
pkgver=3.3RC1
pkgrel=2
pkgdesc="A powerful text editor modelled on the VM/CMS text editor XEDIT with the best features of Mansfield Software's Kedit."
arch=('i686' 'x86_64')
url="http://hessling-editor.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'regina-rexx-das')
provides=('hessling-editor')
options=(!buildflags)
source=("http://downloads.sourceforge.net/$provides/$_pkgname-$pkgver.tar.gz"
        'make-install.patch')
md5sums=('e46b63e533bc458f6f701983b7f2150b'
         'e7898d1e8ac920e972f1dc7d660db1e0')
sha1sums=('a7f0957f077e836ee783d797e424de48e3142b38'
          '0aa2657a6375ce8a727ad36a812c613b9ac6a788')
sha256sums=('dcc1a67c0da5a009ac03e398cf683757a2d2c84081d56da2ddc073fbec48ea38'
            '6b4bbcb6ae2b85ebe3e95713c07ebfc4eede44363cfce89869186163e089d4cf')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i $srcdir/make-install.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset CFLAGS CXXFLAGS LDFLAGS
  ./configure --with-rexx=regina --with-ncurses --prefix=/usr
  make nthe
  make the.man
  make THE_Help.txt
}

package(){
  make -C "$_pkgname-$pkgver" DESTDIR=$pkgdir install
  ln -s nthe "$pkgdir/usr/bin/the"
}

