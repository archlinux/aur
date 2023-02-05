# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=treeviewx
_pkgname=tv
pkgver=0.5.0
pkgrel=1
pkgdesc="Program to display phylogenetic trees"
arch=('x86_64')
url="https://code.google.com/archive/p/treeviewx/"
license=('GPL')
depends=('wxwidgets-gtk3')
makedepends=('git')
source=("git+https://github.com/rdmpage/treeviewx.git"
	"https://storage.googleapis.com/google-code-archive/v2/code.google.com/treeviewx/logo.png"
	"$pkgname.desktop"
	"arch.patch")
md5sums=('SKIP'
         '52f1937a3e0d194dba9fc00f87105ca7'
         '5045bd3f49af4088085e30c0270962d5'
         '096d5f3f7beb7e0ef749cca6fa60c601')
prepare(){
  cd $srcdir/$pkgname
  patch -np1 < $srcdir/arch.patch
  mv configure.{in,ac}
  echo "Roderic D.M. Page" > AUTHORS
  echo "version 0.5, Feb 4, 2023 Guoyi Zhang, BioArchLinux" > ChangeLog
}
build() {
  cd $srcdir/$pkgname
  autoupdate
  aclocal && automake -a && autoconf
  ./configure  --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
  install -Dm 644 $srcdir/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}


