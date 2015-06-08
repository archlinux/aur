# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=texi2latex  
pkgver=0.9.4
pkgrel=2
pkgdesc="convert texinfo sources to LaTeX"
url="http://savannah.nongnu.org/projects/texi2latex"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'sh' 'java-saxon')
install=$pkgname.install
source=(http://mirrors.zerg.biz/nongnu/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('73285a6f0bb988a6673b445a71bf94fd')
build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's+local++' Makefile || return 1
  for _dir in info tbrplent xslt
  do
    pushd ${_dir}
    sed -i 's+local++' Makefile || return 1
    popd
  done
  make || return 1
  make USRDIR=$pkgdir/usr  install || return 1
  sed -i 's+/local++' $pkgdir/usr/bin/texi2latex || return 1
}
